module TaxCloud

  class LookupResponse < ResponseBase

    attr_accessor :cart_id, :cart_items_response

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
      super
    end

    def cart_items_response
      response = TaxCloud::CartItemsResponse.new(@cart_items_response)
    end

  end

end

