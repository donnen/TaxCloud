require 'spec_helper.rb'
require 'helper.rb'

require "service/lookup_service"

RSpec.configure do |c|
  c.include Helper
end

describe "Perform Lookup" do

  before(:all) do
    variable_init
  end

  it "should not allow unauthorized access" do
    api_id = "12345"
    api_key = "67890"

    lookup_service = TaxCloud::LookupService.new(@client)

    lookup_response = lookup_service.lookup(api_id, api_key, @customer_id, @cart_id, @origin, @destination, @cart_items)

    lookup_response.response_type.to_s.should.eql?("Error")
    lookup_response.messages[:message].should.eql?("Invalid apiLoginID and/or apiKey")
  end

  it "should return tax amounts" do

    lookup_service = TaxCloud::LookupService.new(@client)

    lookup_response = lookup_service.lookup(@api_id, @api_key, @customer_id, @cart_id, @origin, @destination, @cart_items)

    lookup_response.response_type.to_s.should.eql?("OK")

    # Note, these amounts are just meant to represent a successful transaction.
    # The amounts may change as the states adjust their rates. In that case you would have to update this test.
    lookup_response.cart_items_response.get_taxes(0).should eql("1.89905")
    lookup_response.cart_items_response.get_taxes(1).should eql("0.94905")
    lookup_response.cart_items_response.get_taxes(2).should eql("1.89905")

  end


end