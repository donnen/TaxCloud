module TaxCloud
  class ReturnedService < BaseService
    def return(order_id, cart_items, returned_date)
      order_json = {
        'apiLoginId' => api_key,
        'orderID' => order_id,
        'cartItems' => cart_item_json(cart_items),
        'returnedDate' => formatted_date(returned_date)
      }

      response = conn.post '/1.0/taxcloud/Returned?apiKey=' + api_login_id,
                           order_json
      TaxCloud::Response.new(response)
    end
  end
end
