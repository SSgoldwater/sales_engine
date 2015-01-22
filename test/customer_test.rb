require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer.rb'

class CustomerTest < Minitest::Test

  def setup
    @customer = Customer.new({:id => 1, :first_name => "John", :last_name => "Smith"}, nil)
  end

  def test_it_exists?
    assert @customer
  end

  def test_it_stores_an_id
    assert_equal 1, @customer.id
  end

  def test_it_stores_a_name
    assert_equal "John", @customer.first_name
    assert_equal "Smith", @customer.last_name
  end

end

require_relative '../lib/customer_parser.rb'

class CustomerParserTest < Minitest::Test

  def test_it_exists
    filename = "./test/support/customers_test.csv"
    invoiceparser = CustomerParser.new(filename)
    assert invoiceparser
  end

  def test_it_parses_a_csv
    filename = "./test/support/customers_test.csv"
    customerparser = CustomerParser.new(filename)
    customers = customerparser.parse

    first = customers[0]
    assert_equal "Joey", first.first_name
    assert_equal "Ondricka", first.last_name
    assert_equal 1, first.id

    second = customers[1]
    assert_equal "Cecelia", second.first_name
    assert_equal "Osinski", second.last_name
    assert_equal 2, second.id
  end

end
