module TaxCloud
  class Response
    attr_accessor :status, :error_message

    def initialize(response)
      body = response.body
      body_hash = JSON.parse(body)
      if response.status == 200 && body_hash['ResponseType'] == 3
        self.status = 200
        self.error_message = nil
      else
        self.status = 400
        self.error_message = body_hash['Messages'][0]['Message']
      end
    end
  end
end
