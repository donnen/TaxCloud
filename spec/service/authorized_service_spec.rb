require 'spec_helper.rb'
require 'helper.rb'
require "service/authorized_service"
require "service/lookup_service"


RSpec.configure do |c|
  c.include Helper
end

describe "complete transaction by calling AuthorizeAndCapture" do

  before (:all) do
    variable_init
  end


  it "should complete the transaction using authorized_with_capture" do

    # We need to to a lookup first to create the start of the transaction
    lookup_service = TaxCloud::LookupService.new(@client)
    lookup_response = lookup_service.lookup(@api_id, @api_key, @customer_id, @cart_id, @origin, @destination, @cart_items)

    # Here we are letting the service create a cart ID for us
    @cart_id = lookup_response.cart_id

    # And now for the actual test

    authorized_service = TaxCloud::AuthorizedService.new(@client)

    authorized_response = authorized_service.authorized_with_capture(@api_id, @api_key, @customer_id, @cart_id, @order_id, @date_authorized, @date_captured)

    puts 'authorizedRsp: ' + authorized_response.response_type.to_s

    response_type = authorized_response.response_type

    response_type.should eql 'OK'


  end

  it "should complete the transaction using separate authorized and capture calls" do
    # We need to to a lookup first to create the start of the transaction
    lookup_service = TaxCloud::LookupService.new(@client)
    lookup_response = lookup_service.lookup(@api_id, @api_key, @customer_id, @cart_id, @origin, @destination, @cart_items)

    # Here we are letting the service create a cart ID for us
    @cart_id = lookup_response.cart_id

    # And now for the actual test

    authorized_service = TaxCloud::AuthorizedService.new(@client)

    authorized_response = authorized_service.authorized(@api_id, @api_key, @customer_id, @cart_id, @order_id, @date_authorized)

    puts 'response type: ' + authorized_response.response_type.to_s
    authorized_response.response_type.should eql 'OK'

    # Now capture the transaction
    captured_response = authorized_service.captured(@api_id, @api_key, @order_id)

    captured_response.response_type.should eql 'OK'


  end
end