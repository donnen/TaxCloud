module TaxCloud
  class VerifyAddressService < BaseService
    def verify_address(address)
      response = conn.post '/1.0/taxcloud/VerifyAddress?apiKey=' + api_login_id,
                           address_json(address)
      parse_address(response)
    end

    private

    def parse_address(response)
      body = response.body
      body_hash = JSON.parse(body)
      if response.status == 200 && body_hash['ErrNumber'] == '0'
        address = TaxCloud::Address.new
        address.address_1 = body_hash['Address1']
        address.address_2 = body_hash['Address2']
        address.city = body_hash['City']
        address.state = body_hash['State']
        address.zip_5 = body_hash['Zip5']
        address.zip_4 = body_hash['Zip4']
        address
      else
        raise body_hash['ErrDescription']
      end
    end
  end
end
