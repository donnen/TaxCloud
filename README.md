== TaxCloud Sales Tax Calculation Service

TaxCloud is a free hosted service that calculates the sales tax due on your transactions. Using TaxCloud
is as easy as calculating real-time shipping, a common feature in most shopping carts today. When you
calculate real-time shipping, your website sends a request to the shipper to determine the cost of
shipping at a certain speed to a particular location. TaxCloud works the same way.

When a customer is ready to check out, TaxCloud sends your website the sales tax amount based on the
origin, destination, and class of goods. Your website displays that sales tax amount and adds it on
to the customer’s total. The customer finishes checking out, and your website notifies TaxCloud that
the purchase was completed, allowing us to keep record the transaction for you.

TaxCloud operates on a real-time web services API.

See https://dev.taxcloud.com for more information and to sign up for a free account

## Installation

Add this line to your application's Gemfile:

    gem 'taxcloud'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taxcloud

NOTE: Version 2.0.0 or greater is not compatible with older versions of the gem. It has been updated to work
with the new RESTful web services provided by TaxCloud. Do not update to this version of the gem if you are using
an older version unless you also want to rework your code to work with the new services.

## Usage

== Getting Started

1. Create a TaxCloud merchant account at http://www.TaxCloud.net

2. Add a website to your TaxCloud account. This will generate an API ID and API Key that you will
need to use the service.

3. Add your TaxCloud credentials to your environment:

API_KEY="YOUR_API_KEY"
API_LOGIN_ID="YOUR_API_LOGIN_ID"

4. Add the TaxCloud gem to your application.

5. Call the TaxCloud services to calculate sales tax.

== Using the web services

TaxCloud's API is build as a standard RESTful service. This gem is not required
to use TaxCloud. It is meant to give examples of how to use the services and to help
speed integration by supplying essential classes.

TaxCloud determines a sales tax rate based on the merchant's origin address, the
customer's shipping address and the type of project. There are three main services
that will need to be integrated: verify_address(), lookup(), and authorized_with_capture().

This process is designed with a shopping cart checkout in mind, but it can be used for
other applications. In a shopping cart the process would be to verify the customer's
shipping address, and then call lookup() with the addresses and the items in the shopping
cart. This will return the tax to apply to each item in the cart. Shipping is also included
in the calculation as it can sometimes be taxable.

If your system already verifies the shipping address you can skip the verify_address() step.

Once the tax has been added to the order and you are ready to complete the transaction the
authorized_and_captured() service is called and the transaction details are recorded.

You can reverse a cancelled order by calling the returned() service.

The specs give some examples of how to use each service.

There are also services available to look up the TIC codes available in the TaxCloud system.
The Taxability Identifier Codes define the type of product being sold so that the correct tax
can be applied. More information is available at: http://www.taxcloud.net/tic/

## Contributing

1. Fork it ( https://github.com/donnen/taxcloud/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request



