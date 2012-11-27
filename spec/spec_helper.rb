# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../lib/tax_cloud/response/response_base", __FILE__)
require File.expand_path("../../lib/tax_cloud/response/verify_address_result", __FILE__)
require File.expand_path("../../lib/tax_cloud/address", __FILE__)
require File.expand_path("../../lib/tax_cloud/cartitem", __FILE__)
require 'rspec'
require 'savon'



