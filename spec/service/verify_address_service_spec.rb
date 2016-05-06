require 'spec_helper'

RSpec.describe 'VerifyAddressService' do
  it 'should verify an address' do
    address = TaxCloud::Address.new
    address.address_1 = '162 East Avenue'
    address.address_2 = 'Third Floor'
    address.city = 'Norwalk'
    address.state = 'WA'
    address.zip_5 = '06851'
    address.zip_4 = '0000'

    VCR.use_cassette('verify_address') do
      service = TaxCloud::VerifyAddressService.new
      verified_address = service.verify_address(address)
      expect(verified_address.address_1).to eq('162 East Ave # 3')
      expect(verified_address.address_2).to eq(nil)
      expect(verified_address.city).to eq('Norwalk')
      expect(verified_address.state).to eq('CT')
      expect(verified_address.zip_5).to eq('06851')
      expect(verified_address.zip_4).to eq('5715')
    end
  end

  it 'should throw an exception for an invalid address' do
    VCR.use_cassette('invalid_verify_address') do
      service = TaxCloud::VerifyAddressService.new
      address = TaxCloud::Address.new
      expect { service.verify_address(address) }.to raise_error('Unable to process address')
    end
  end
end
