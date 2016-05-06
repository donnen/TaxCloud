require 'spec_helper'

RSpec.describe 'PingService' do
  it 'should return a success ping response' do
    service = TaxCloud::PingService.new

    VCR.use_cassette('ping') do
      expect(service.ping.status).to eq(200)
    end
  end
end
