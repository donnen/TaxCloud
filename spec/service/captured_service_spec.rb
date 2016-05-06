require 'spec_helper'

RSpec.describe 'CaptureService' do
  it 'should successfully capture a previously authorized order' do
    customer_id = random_id
    cart_id = random_id
    order_id = random_id

    VCR.use_cassette('lookup_for_captured') do
      lookup_service = TaxCloud::LookupService.new
      response = lookup_service.lookup(cart(customer_id, cart_id))
      expect(response.status).to eq(200)
    end

    VCR.use_cassette('authorize') do
      authorized_service = TaxCloud::AuthorizedService.new
      status = authorized_service.authorize(customer_id, cart_id,
                                            order_id).status
      expect(status).to eq(200)
    end

    VCR.use_cassette('captured') do
      captured_service = TaxCloud::CapturedService.new
      expect(captured_service.capture(order_id).status).to eq(200)
    end
  end
end
