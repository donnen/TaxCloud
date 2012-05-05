module TaxCloud
  require "service/base_service"
  require 'response/get_ti_cs_response'

  class TICService < BaseService

    def get_tics(api_id, api_key)

      response = client.request :get_ti_cs do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key}
      end

      get_tics_response = TaxCloud::GetTICsResponse.new(response.to_hash[:get_ti_cs_response][:get_ti_cs_result])
    end

    def get_tic_groups(api_id, api_key)
      #get_tic_groups
    end

    def get_tics_by_group(api_id, api_key, group_id)
      #get_ti_cs_by_group
    end

  end

end