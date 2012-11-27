module TaxCloud

  class Address

    attr_accessor :address1, :address2, :city, :state, :zip5, :zip4

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end

    end

    def to_hash
      {
          'Address1' => address1,
          'Address2' => address2,
          'City' => city,
          'State' => state,
          'Zip5' => zip5,
          'Zip4' => zip4
      }
    end

  end

end