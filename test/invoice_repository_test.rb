require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_repository.rb'

class InvoiceRepositoryTest < Minitest::Test

  def test_it_exists
    invoice_repository = InvoiceRepository.new
    assert invoice_repository
  end




end
