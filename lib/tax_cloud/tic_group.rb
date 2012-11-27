module TaxCloud

  class TICGroup

    attr_accessor :group_id, :description

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
      super
    end

  end

end