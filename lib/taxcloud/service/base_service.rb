module TaxCloud
  require 'faraday'
  require 'json'
  require 'taxcloud/lookup_response'

  class BaseService
    def initialize
      validate_configuration
    end

    def conn
      Faraday.new(url: 'https://api.taxcloud.net') do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
      end
    end

    def validate_configuration
      if api_key.nil? || api_login_id.nil?
        raise 'api_key and api_login_id are required'
      end
    end

    def api_key
      ENV['API_KEY']
    end

    def api_login_id
      ENV['API_LOGIN_ID']
    end

    def formatted_date(date)
      date.strftime('%Y-%m-%d')
    end

    def cart_item_json(cart_items)
      cart_items.each.map do |cart_item|
        {
          'Qty' => cart_item.quantity,
          'Price' => cart_item.price,
          'TIC' => cart_item.tic,
          'ItemID' => cart_item.item_id,
          'Index' => cart_item.index
        }
      end
    end

    def address_json(address)
      {
        'Zip4' => address.zip_4,
        'Zip5' => address.zip_5,
        'State' => address.state,
        'City' => address.city,
        'Address2' => address.address_2,
        'Address1' => address.address_1
      }
    end
  end
end
