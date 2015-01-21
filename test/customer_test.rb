require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer.rb'

class CustomerTest < Minitest::Test


  def test_it_exists?
    customer = Customer.new
    assert customer
  end


end
