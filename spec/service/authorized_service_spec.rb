require 'spec_helper'

RSpec.describe 'AuthorizedService' do
  it 'should authorize an order' do
    VCR.use_cassette('authorize') do
      customer_id = random_id
      cart_id = random_id
      order_id = random_id

      lookup_service = TaxCloud::LookupService.new
      response = lookup_service.lookup(cart(customer_id, cart_id))
      expect(response.status).to eq(200)

      authorized_service = TaxCloud::AuthorizedService.new
      status = authorized_service.authorize(customer_id, cart_id,
                                            order_id).status
      expect(status).to eq(200)
    end
  end
end
