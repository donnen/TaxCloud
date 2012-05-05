require 'spec_helper.rb'
require 'helper.rb'
require 'service/verify_address_service'

RSpec.configure do |c|
  c.include Helper
end

describe "Verify Address Service" do

  before(:all) do
    variable_init
  end

  specify "should return a verified address" do

    verify_address_service = TaxCloud::VerifyAddressService.new(@client)
    verify_address_response = verify_address_service.verify_address(@api_id, @api_key, @usps_id, @origin)

    verify_address_response.address1.to_s.should eql '162 EAST AVE'
    verify_address_response.zip4.to_s.should eql '5715'

  end
end