require 'spec_helper.rb'
require 'helper.rb'

require 'tax_cloud/service/tic_service'

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

    get_tics_response.get_tic(0).tic_id.should == '10005'
    get_tics_response.get_tic(0).description.should == 'Gift Card/Certificate'

    get_tics_response.get_tics.length.should > 289 #TICs are periodically added

  end

  specify "should return a list of TIC groups" do

    tic_service = TaxCloud::TICService.new(@client)

    get_tic_groups_response = tic_service.get_tic_groups(@api_id, @api_key)
    puts 'tic groups response: ' +get_tic_groups_response.to_s

    get_tic_groups_response.get_tic_groups.length.should > 11 #TIC groups are periodically added

    tic_group = get_tic_groups_response.get_tic_groups[0]
    tic_group.group_id.should == '1'
    tic_group.description.should.eql? 'Administrative'

  end

  specify "should return a list of TICs per group" do

    tic_service = TaxCloud::TICService.new(@client)

    group_id = 2
    get_tics_by_group_response = tic_service.get_tics_by_group(@api_id, @api_key, group_id)

    get_tics_by_group_response.get_tics.length.should > 5 #TICs are periodically added

    tic = get_tics_by_group_response.get_tics[0]
    tic.tic_id.should == '20010'
    tic.description.should == 'Clothing'
  end
end