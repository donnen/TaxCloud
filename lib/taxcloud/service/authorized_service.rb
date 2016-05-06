module TaxCloud
  class AuthorizedService < BaseService
    def authorize(customer_id, cart_id, order_id,
        date_authorized = DateTime.now)

      authorize_json = {
        'customerID' => customer_id,
        'apiLoginId' => api_key,
        'cartID' => cart_id,
        'orderID' => order_id,
        'dateAuthorized' => formatted_date(date_authorized)
      }

      response = conn.post '/1.0/taxcloud/Authorized?apiKey=' + api_login_id,
                           authorize_json
      TaxCloud::Response.new(response)
    end
  end
end
