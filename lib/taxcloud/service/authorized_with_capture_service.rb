module TaxCloud
  class AuthorizedWithCaptureService < BaseService
    def authorize_with_capture(customer_id, cart_id, order_id,
        date_authorized = DateTime.now,
        date_captured = DateTime.now)
      response = conn.post '/1.0/taxcloud/AuthorizedWithCapture?apiKey=' + api_login_id,
                           authorized_with_capture_json(customer_id, cart_id, order_id,
                                                        date_authorized, date_captured)
      TaxCloud::Response.new(response)
    end

    private

    def authorized_with_capture_json(customer_id, cart_id, order_id,
        date_authorized, date_captured)
      {
        'apiLoginId' => api_key,
        'customerID' => customer_id,
        'cartID' => cart_id,
        'orderID' => order_id,
        'dateAuthorized' => date_authorized,
        'dateCaptured' => date_captured
      }
    end
  end
end
