module TaxCloud

  class GetTICsByGroupResponse < ResponseBase

    attr_accessor :ti_cs

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
      super
    end
    def get_tics
      tics = []
      ti_cs[:tic].each do |a_tic|
        puts 'tic: ' + a_tic.to_s
        tic = TaxCloud::TIC.new(a_tic)
        tics << tic
      end
      tics
    end

  end

end