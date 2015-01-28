require 'csv'
require_relative './merchant_repository.rb'
require_relative './customer_repository.rb'
require_relative './item_repository.rb'
require_relative './invoice_repository.rb'
require_relative './transaction_repository.rb'
require_relative './invoice_item_repository.rb'
require 'pry'


class SalesEngine
  attr_reader :merchant_repository, :customer_repository, :item_repository, :invoice_repository, :transaction_repository, :invoice_item_repository

  def initialize(files)
    @merchant_repository = MerchantRepository.new(files + "/merchants.csv", self)
    @customer_repository = CustomerRepository.new(files + "/customers.csv", self)
    @item_repository = ItemRepository.new(files + "/items.csv", self)
    @invoice_repository = InvoiceRepository.new(files + "/invoices.csv", self)
    @transaction_repository = TransactionRepository.new(files + "/transactions.csv", self)
    @invoice_item_repository = InvoiceItemRepository.new(files + "/invoice_items.csv", self)
  end

  def startup


  end




end


# engine = SalesEngine.new("/Users/Goldwater/Desktop/Development/sales_engine/data")
# binding.pry
# engine.startup
#
# customer = engine.customer_repository.random
# puts customer
