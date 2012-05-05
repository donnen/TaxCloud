module TaxCloud
  require 'TIC'

  class GetTICsResponse < ResponseBase
    attr_accessor :ti_cs

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
      super
    end

    def get_tic(index)
      tic = TaxCloud::TIC.new(ti_cs.first.first)
    end
  end
end