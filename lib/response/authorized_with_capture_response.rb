module TaxCloud

  class AuthorizedWithCaptureResponse < ResponseBase

    def initialize(attrs = {})
      attrs.each do |sym, val|
        self.send "#{sym}=", val
      end
      super
    end

    attr_accessor :authorized_with_capture_result

  end

end