module TaxCloud

  require "tax_cloud/service/base_service"

  class VerifyAddressService < BaseService

    def verify_address(api_id, api_key, usps_id, address)
      request_params = {
          'apiLoginId' => api_id,
          'apiKey' => api_key,
          'uspsUserID' => usps_id,
          'address1' => address.address1,
          'address2' => address.address2,
          'city' => address.city,
          'state' => address.state,
          'zip5' => address.zip5,
          'zip4' => address.zip4
      }
      response = client.request :verify_address, :body => request_params

      verifyAddressResult = TaxCloud::VerifyAddressResult.new(response.to_hash[:verify_address_response][:verify_address_result])
    end

  end

end