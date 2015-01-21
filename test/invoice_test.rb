require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice.rb'

class InvoicesTest < Minitest::Test

  def test_it_exists
    invoice = Invoice.new
    assert invoice
  end




end
