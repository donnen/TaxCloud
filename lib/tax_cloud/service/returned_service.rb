module TaxCloud

  # If you have previously completed an order you can return one or more of the items in the order
  class ReturnedService < BaseService

    def returned(api_id, api_key, order_id, cart_items, returned_date)
      response = client.request :returned do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key,
                     'orderID' => order_id, 'cartItems' => {'CartItem' => cart_items.map(&:to_hash)}, 'returnedDate' => returned_date}
      end

      returned_response = TaxCloud::ReturnedResponse.new(response.to_hash[:returned_response][:returned_result])
    end

  end

end