require 'pry'
require 'csv'

class Customer
  attr_reader :id, :first_name, :last_name

  def initialize(data_line, engine)
    @engine = engine
    @id = data_line[:id]
    @first_name = data_line[:first_name]
    @last_name = data_line[:last_name]
  end

  def invoices
    @engine.invoice_repository.find_all_by_customer_id(@id.to_i)
  end

  def transactions
    invoices
  end

  def favorite_merchant
    invoices = @engine.invoice_repository.get_customer_merchant_invoices(@id)
    merchants = invoices.map{|invoice| @engine.merchant_repository.find_by_id(invoice.merchant_id)}
    merchants[0]
    #returns an instance of Merchant where the customer has conducted the most successful transactions
  end

end
