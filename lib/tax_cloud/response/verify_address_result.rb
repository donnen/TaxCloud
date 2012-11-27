module TaxCloud

  class VerifyAddressResult

    attr_accessor :address1, :address2, :city, :state, :zip5, :zip4, :err_number, :err_description

    def initialize(attrs = {})
       attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
    end

    def get_address
      address = TaxCloud::Address.new(:address1 => @address1, :address2 => @address2, :city => @city, :state => @state, :zip5 => @zip5, :zip4 => @zip4)
    end


  end

end

