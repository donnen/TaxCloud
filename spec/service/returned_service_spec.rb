require 'spec_helper.rb'
require 'helper.rb'
require 'service/lookup_service'
require 'service/authorized_service'
require 'service/returned_service'

RSpec.configure do |c|
  c.include Helper
end

describe "Returned Service" do

  before(:all) do
    variable_init
  end

  it "should allow an item to be returned" do

    # An order needs to be completed before an item can be returned
    lookup_service = TaxCloud::LookupService.new(@client)
    lookup_response = lookup_service.lookup(@api_id, @api_key, @customer_id, @cart_id, @origin, @destination, @cart_items)

    # Here we are letting the service create a cart ID for us
    @cart_id = lookup_response.cart_id

    authorized_service = TaxCloud::AuthorizedService.new(@client)

    authorized_response = authorized_service.authorized_with_capture(@api_id, @api_key, @customer_id, @cart_id, @order_id, @date_authorized, @date_captured)

    # And now for the actual test
    returned_service = TaxCloud::ReturnedService.new(@client)
    returned_response = returned_service.returned(@api_id, @api_key, @order_id, @cart_items, @returned_date)
    returned_response.response_type.to_s.should eql 'OK'

  end
end