module TaxCloud

  class LookupService < BaseService

    def lookup(api_id, api_key, customer_id, cart_id, origin, destination, cart_items)

      response = client.request :lookup do
        soap.body = {:apiLoginID => api_id, :apiKey => api_key,
                     'customerID' => customer_id, 'cartID' => cart_id, 'cartItems' => {'CartItem' => cart_items.map(&:to_hash)}, 'origin' => origin.to_hash, 'destination' => destination.to_hash}
      end
      puts 'response: ' + response.to_s

      lookupResponse = TaxCloud::LookupResponse.new(response.to_hash[:lookup_response][:lookup_result])

    end

  end

end