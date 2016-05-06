require 'spec_helper'

RSpec.describe 'LookupService' do
  it 'should return the tax amount for each item in the cart' do
    customer_id = random_id
    cart_id = 'c2a0f813-7167-4875-a04b-f63e48588a19'

    VCR.use_cassette('lookup') do
      service = TaxCloud::LookupService.new
      response = service.lookup(cart(customer_id, cart_id))

      expect(response.tax_amounts[0]).to eq(0.95904)
      expect(response.tax_amounts[1]).to eq(1.91904)

      expect(response.status).to eq(200)

      expect(response.cart_id).to eq(cart_id)
    end
  end

  it 'should allow you to do a lookup for a particular date' do
    customer_id = random_id
    cart_id = '906209d3-0af4-4eab-a55f-aeff37aeb290'

    lookup_date = DateTime.now + 100

    VCR.use_cassette('lookup_for_date') do
      service = TaxCloud::LookupService.new
      response = service.lookup_for_date(cart(customer_id, cart_id),
                                         lookup_date)

      expect(response.tax_amounts[0]).to eq(0.95904)
      expect(response.tax_amounts[1]).to eq(1.91904)

      expect(response.status).to eq(200)

      expect(response.cart_id).to eq(cart_id)
    end
  end
end
