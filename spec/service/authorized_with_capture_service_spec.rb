require 'spec_helper'

RSpec.describe 'AuthorizedWithCaptureService' do
  it 'should authorize and capture and order in one call' do
    customer_id = random_id
    cart_id = random_id
    order_id = random_id

    VCR.use_cassette('lookup_for_authorize_with_capture') do
      lookup_service = TaxCloud::LookupService.new
      response = lookup_service.lookup(cart(customer_id, cart_id))
      expect(response.status).to eq(200)
    end

    VCR.use_cassette('authorize_with_capture') do
      authorized_with_capture_service = TaxCloud::AuthorizedWithCaptureService.new
      status = authorized_with_capture_service.authorize_with_capture(customer_id,
                                                                      cart_id, order_id).status
      expect(status).to eq(200)
    end
  end
end
