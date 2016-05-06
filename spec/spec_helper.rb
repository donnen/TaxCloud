ENV['RAILS_ENV'] ||= 'test'

require_relative '../spec/support/request_helper'

RSpec.configure do |c|
  c.include RequestHelper
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('YOUR%20API%20LOGINID%20HERE') { ENV['API_LOGIN_ID'] }
  config.filter_sensitive_data('YOUR%20API%20KEY%20HERE') { ENV['API_KEY'] }
end
