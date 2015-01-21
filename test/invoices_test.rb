require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoices.rb'

class InvoicesTest < Minitest::Test

  def test_it_exists
    invoices_repository = InvoicesRepository.new
    assert invoices_repository
  end




end
