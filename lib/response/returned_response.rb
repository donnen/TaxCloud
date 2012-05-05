module TaxCloud

  class ReturnedResponse < ResponseBase

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
      super
    end


  end

end