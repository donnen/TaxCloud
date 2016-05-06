module TaxCloud
  class Cart
    attr_accessor :customer_id, :cart_id, :cart_items, :origin_address,
                  :destination_address, :delivered_by_seller
  end
end
