module TaxCloud
  class TIC
    attr_accessor :tic, :tic_id, :description

    def initialize(tic)
      puts 'initialize: ' + tic.to_s
      self.tic = tic
      self.tic_id = tic['ticid']
      self.description = tic['description']
    end


  end
end