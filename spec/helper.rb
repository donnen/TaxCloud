module Helper

  def variable_init
      @client = Savon::Client.new do
        wsdl.document = "https://api.taxcloud.net/1.0/TaxCloud.asmx?wsdl"
      end
      cart_item = TaxCloud::CartItem.new(:index => 0, :item_id => 0, :tic => '00000', :price => '19.99', :quantity => 1)
      cart_item1 = TaxCloud::CartItem.new(:index => 1, :item_id => 1, :tic => '20010', :price => '9.99', :quantity => 1)

      # Add a cart item for shipping charges, if applicable
      cart_item2 = TaxCloud::CartItem.new(:index => 2, :item_id => 99999, :tic => '11010', :price => '19.99', :quantity => 1)

      @cart_items = Array.new
      @cart_items << cart_item
      @cart_items << cart_item1
      @cart_items << cart_item2

      @origin = TaxCloud::Address.new(:address1 => '162 East Avenue', :address2 => 'Third Floor', :city => 'Norwalk', :state => 'CT', :zip5 => '06851')

      #origin = verify_address(client, origin)

      @destination = TaxCloud::Address.new(:address1 => '3121 West Government Way', :address2 => 'Suite 2B', :city => 'Seattle', :state => 'WA', :zip5 => '98199')

      #destination = verify_address(client, destination)
      @customer_id = 1001
      @cart_id = nil
      @order_id = 1001

      # You will have to populate these values from your TaxCloud merchant account
      @api_id = "11E1A300"
      @api_key = "0387AFE9-8F65-4F54-84C0-162126EFD110"
      @usps_id = "597FEDTA4827"

      @date_authorized = Date.today
      @date_captured = Date.today
      @returned_date = Date.today
  end
end
