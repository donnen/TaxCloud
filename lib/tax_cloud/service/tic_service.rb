module TaxCloud
  require "tax_cloud/service/base_service"
  require 'tax_cloud/response/get_ti_cs_response'
  require 'tax_cloud/response/get_tic_groups_response'
  require 'tax_cloud/response/get_ti_cs_by_group_response'

  class TICService < BaseService

    def get_tics(api_id, api_key)

      response = client.request :get_ti_cs do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key}
      end

      get_tics_response = TaxCloud::GetTICsResponse.new(response.to_hash[:get_ti_cs_response][:get_ti_cs_result])
    end

    def get_tic_groups(api_id, api_key)

      response = client.request :get_tic_groups do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key}
      end
      get_tic_groups_response = TaxCloud::GetTICGroupsResponse.new(response.to_hash[:get_tic_groups_response][:get_tic_groups_result])
    end

    def get_tics_by_group(api_id, api_key, group_id)

      response = client.request :get_ti_cs_by_group do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key, :tic_group => group_id}
      end
      puts 'response: ' + response.to_s
      get_tics_by_group_response = TaxCloud::GetTICsByGroupResponse.new(response.to_hash[:get_ti_cs_by_group_response][:get_ti_cs_by_group_result])
    end

  end

end