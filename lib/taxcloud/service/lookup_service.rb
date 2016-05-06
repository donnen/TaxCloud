module TaxCloud
  class LookupService < BaseService
    def lookup(cart)
      response = conn.post '/1.0/TaxCloud/Lookup?apiKey=' + api_login_id,
                           JSON.generate(request_json(cart)),
                           content_type: 'application/json'
      TaxCloud::LookupResponse.new(response)
    end

    def lookup_for_date(cart, use_date)
      request = request_json(cart).merge('useDate' => formatted_date(use_date))
      response = conn.post '/1.0/TaxCloud/LookupForDate?apiKey=' + api_login_id,
                           JSON.generate(request),
                           content_type: 'application/json'
      TaxCloud::LookupResponse.new(response)
    end

    private

    def request_json(cart)
      {
        'apiLoginID' => api_key,
        'customerID' => cart.customer_id,
        'cartItems' => cart_item_json(cart.cart_items),
        'origin' => address_json(cart.origin_address),
        'destination' => address_json(cart.destination_address),
        'cartID' => cart.cart_id,
        'deliveredBySeller' => cart.delivered_by_seller || 'false'
      }
    end
  end
end
