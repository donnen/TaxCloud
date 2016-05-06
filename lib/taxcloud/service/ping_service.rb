module TaxCloud
  class PingService < BaseService
    def ping
      body = { 'apiLoginId' => api_key }
      conn.post '/1.0/taxcloud/Ping?apiKey=' + api_login_id, body
    end
  end
end
