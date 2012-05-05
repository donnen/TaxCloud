module TaxCloud

  class ResponseBase
    # response_type is an instance of MessageType
    # messages is an Array of ResponseMessage
    attr_accessor :response_type, :messages

  end

end