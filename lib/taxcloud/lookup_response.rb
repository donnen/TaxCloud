module TaxCloud
  require 'taxcloud/response'

  class LookupResponse < TaxCloud::Response
    attr_accessor :tax_amounts, :cart_id, :response

    def initialize(response)
      self.response = response
      super(response)
    end

    def body
      response.body
    end

    def body_hash
      JSON.parse(body)
    end

    def tax_amounts
      body_hash['CartItemsResponse'].each.map do |cart_item_response|
        cart_item_response['TaxAmount']
      end
    end

    def cart_id
      body_hash['CartID']
    end
  end
end
