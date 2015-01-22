require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer.rb'
require_relative '../lib/customer_parser.rb'
require 'pry'

class CustomerTest < Minitest::Test

  def test_it_exists?
    customer = Customer.new({:id => 1}, nil)
    assert customer
  end

end




class CustomerParserTest < Minitest::Test

  def test_it_exists
    filename = ".test/support/customers_test.csv"
    customerparser = CustomerParser.new(filename)
    assert customerparser
  end

  def test_it_parses_a_csv
    filename = "./test/support/customers_test.csv"
    customerparser = CustomerParser.new(filename)
    customers = customerparser.parse

    first = customers[0]
    assert_equal 1, first.id
    assert_equal "Joey", first.first_name
    assert_equal "Ondricka", first.last_name

    second = customers[1]
    assert_equal 2, second.id
    assert_equal "Cecelia", second.first_name
    assert_equal "Osinski", second.last_name
  end

end
