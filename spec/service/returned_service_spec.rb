require 'spec_helper'

RSpec.describe 'ReturnedService' do
  it 'should allow all items in a previous order to be returned' do
    order_id = random_id
    customer_id = random_id

    # Do a lookup
    service = TaxCloud::ReturnedService.new
    lookup_service = TaxCloud::LookupService.new
    cart_id = nil
    VCR.use_cassette('lookup') do
      lookup_response = lookup_service.lookup(cart(customer_id, nil))
      cart_id = lookup_response.cart_id
    end

    # Do an Authorized and Capture
    VCR.use_cassette('authorize_with_capture') do
      authorized_and_capture_service = TaxCloud::AuthorizedWithCaptureService.new
      authorized_and_capture_service.authorize_with_capture(customer_id,
                                                          cart_id, order_id)
    end

    returned_date = DateTime.now
    VCR.use_cassette('returned') do
      status = service.return(order_id, cart_items, returned_date).status
      expect(status).to eq(200)
    end
  end

  it 'should allow a a partial return of items in an order' do
    order_id = random_id
    customer_id = random_id

    # Do a lookup
    cart_id = nil
    VCR.use_cassette('lookup') do
      lookup_service = TaxCloud::LookupService.new
      lookup_response = lookup_service.lookup(cart(customer_id, nil))
      cart_id = lookup_response.cart_id
    end

    # Do an Authorized and Capture
    VCR.use_cassette('authorize_with_capture') do
      authorized_and_capture_service = TaxCloud::AuthorizedWithCaptureService.new
      authorized_and_capture_service.authorize_with_capture(customer_id,
                                                          cart_id, order_id)
    end

    returned_date = DateTime.now

    service = TaxCloud::ReturnedService.new
    VCR.use_cassette('partial_return') do
      status = service.return(order_id, cart_items[0..1], returned_date).status
      expect(status).to eq(200)
    end
  end

  it 'should not allow a previously returned order to be returned again' do
    order_id = random_id
    customer_id = random_id

    # Do a lookup
    cart_id = nil
    VCR.use_cassette('lookup') do
      lookup_service = TaxCloud::LookupService.new
      lookup_response = lookup_service.lookup(cart(customer_id, nil))
      cart_id = lookup_response.cart_id
    end

    # Do an Authorized and Capture
    VCR.use_cassette('authorize_with_capture') do
      authorized_and_capture_service = TaxCloud::AuthorizedWithCaptureService.new
      authorized_and_capture_service.authorize_with_capture(customer_id,
                                                            cart_id, order_id)
    end

    returned_date = DateTime.now
    service = TaxCloud::ReturnedService.new
    VCR.use_cassette('returned') do
      expect(service.return(order_id, cart_items, returned_date).status).to eq(200)
    end

    VCR.use_cassette('invalid_return') do
      error_response = service.return(order_id, cart_items, returned_date)
      expect(error_response.status).to eq(400)
      expect(error_response.error_message).to include('Cannot return the entire order because some items have already been returned')
    end
  end
end
