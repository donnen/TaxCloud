module TaxCloud

  class CartItem
    attr_accessor :index, :item_id, :tic, :price, :quantity

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
    end

    def to_hash
      {
          'Index' => index,
          'ItemID' => item_id,
          'TIC' => tic,
          'Price' => price,
          'Qty' => quantity
      }
    end


  end

end

