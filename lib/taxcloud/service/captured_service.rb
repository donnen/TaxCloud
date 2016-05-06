module TaxCloud
  class CapturedService < BaseService
    def capture(order_id, date_captured = DateTime.now)
      capture_json = {
        'orderID' => order_id,
        'dateCaptured' => date_captured,
        'apiLoginId' => api_key
      }

      response = conn.post '/1.0/taxcloud/Captured?apiKey=' + api_login_id,
                           capture_json
      TaxCloud::Response.new(response)
    end
  end
end
