module TaxCloud

  class AuthorizedService < BaseService

    def authorized_with_capture(api_id, api_key, customer_id, cart_id, order_id, date_authorized, date_captured)
      response = client.request :authorized_with_capture do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key,
                     'customerID' => customer_id, 'cartID' => cart_id, 'orderID' => order_id, 'dateAuthorized' => date_authorized, 'dateCaptured' => date_captured}

      end

      authorized_with_capture_rsp = TaxCloud::AuthorizedWithCaptureResponse.new(response.to_hash[:authorized_with_capture_response][:authorized_with_capture_result])
    end

    def authorized(api_id, api_key, customer_id, cart_id, order_id, date_authorized)
      response = client.request :authorized do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key,
                     'customerID' => customer_id, 'cartID' => cart_id, 'orderID' => order_id, 'dateAuthorized' => date_authorized}

      end

      authorized_response = TaxCloud::AuthorizedResponse.new(response.to_hash[:authorized_response][:authorized_result])

    end

    def captured(api_id, api_key, order_id)
      response = client.request :captured do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key, 'orderID' => order_id}
      end

      captured_response = TaxCloud::CapturedResponse.new(response.to_hash[:captured_response][:captured_result])
    end

  end

end