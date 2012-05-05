require 'spec_helper.rb'
require 'helper.rb'

require 'service/tic_service'

RSpec.configure do |c|
  c.include Helper
end

describe "TIC Service" do

  before(:all) do
    variable_init
  end

  specify "should return a list of TICs" do

    tic_service = TaxCloud::TICService.new(@client)

    get_tics_response = tic_service.get_tics(@api_id, @api_key)

    get_tics_response.response_type.to_s.should eql 'OK'

    get_tics_response.ti_cs.should_not be nil

    puts 'id: ' + get_tics_response.get_tic(0).tic_id.to_s
  end

  specify "should return a list of TIC groups" do

    tic_service = TaxCloud::TICService.new(@client)

    get_tic_groups_response = tic_service.get_tic_groups(@api_id, @api_key)


  end

  specify "should return a list of TICs per group" do

    tic_service = TaxCloud::TICService.new(@client)

    group_id = 1
    get_tics_by_group_response = tic_service.get_tics_by_group(@api_id, @api_key, group_id)

    # get_tics_by_group_response.to_s.should eql 'OK'
  end
end