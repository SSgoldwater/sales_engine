require 'pry'
require 'csv'


class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status

  def initialize(data_line, engine)
    @engine = engine
    @id = data_line[:id].to_i
    @customer_id = data_line[:customer_id].to_i
    @merchant_id = data_line[:merchant_id].to_i
    @status = data_line[:status]
  end

  def transactions
    @engine.transaction_repository.find_all_by_invoice_id(@id)
  end

  def invoice_items
    @engine.invoice_item_repository.find_all_by_invoice_id(@id)
  end

  def items
    @engine.invoice_item_repository.find_all_by_invoice_id(@id)
  end

  def customer
    @engine.customer_repository.find_by_id(@customer_id)
  end

  def merchant
    @engine.merchant_repository.find_by_merchant_id(@merchant_id)
  end

end
