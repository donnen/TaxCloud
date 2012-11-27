module TaxCloud

  class CartItemsResponse
    attr_accessor :cart_item_response #Array of cart_item_response

    def initialize(attrs = {})
      @cart_item_response = attrs[:cart_item_response]
    end

    def get_taxes(cart_item_index)
      # the response may or may not be an array
      if !cart_item_response[cart_item_index].nil?
        taxes = cart_item_response[cart_item_index][:tax_amount]
      else
        taxes = cart_item_response[:tax_amount]
      end
    end


  end

end