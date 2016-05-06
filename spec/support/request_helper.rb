module RequestHelper
  require 'taxcloud/address'
  require 'taxcloud/cart'
  require 'taxcloud/cart_item'

  require 'taxcloud/service/base_service'
  require 'taxcloud/service/authorized_service'
  require 'taxcloud/service/authorized_with_capture_service'
  require 'taxcloud/service/captured_service'
  require 'taxcloud/service/lookup_service'
  require 'taxcloud/service/returned_service'
  require 'taxcloud/service/ping_service'
  require 'taxcloud/service/verify_address_service'

  def random_id
    SecureRandom.uuid
  end

  def cart_items
    [cart_item_one, cart_item_two]
  end

  def cart_item_one
    cart_item = TaxCloud::CartItem.new
    cart_item.index = 0
    cart_item.item_id = 1
    cart_item.price = 9.99
    cart_item.quantity = 1
    cart_item.tic = '00000'
    cart_item
  end

  def cart_item_two
    cart_item = TaxCloud::CartItem.new
    cart_item.index = 1
    cart_item.item_id = 1
    cart_item.price = 19.99
    cart_item.quantity = 1
    cart_item.tic = '20010'
    cart_item
  end

  def origin
    origin_address = TaxCloud::Address.new
    origin_address.address_1 = '162 East Avenue'
    origin_address.address_2 = 'Third Floor'
    origin_address.city = 'Norwalk'
    origin_address.state = 'CT'
    origin_address.zip_5 = '06851'
    origin_address
  end

  def destination
    destination_address = TaxCloud::Address.new
    destination_address.address_1 = '3121 West Government Way'
    destination_address.address_2 = 'Suite 2B'
    destination_address.city = 'Seattle'
    destination_address.state = 'WA'
    destination_address.zip_5 = '98199'
    destination_address
  end

  def cart(customer_id, cart_id)
    test_cart = TaxCloud::Cart.new
    test_cart.customer_id = customer_id
    test_cart.cart_items = cart_items
    test_cart.origin_address = origin
    test_cart.destination_address = destination
    test_cart.cart_id = cart_id
    test_cart
  end
end
