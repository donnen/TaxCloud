module TaxCloud

  class BaseService

    attr_accessor :client

    def initialize(client)
      self.client = client
    end

  end

end