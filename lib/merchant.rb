require 'pry'

class Merchant
  attr_reader :id, :name

  def initialize(data_line, engine)
    @engine = engine
    @id = data_line[:id].to_i
    @name = data_line[:name]
  end

  def items
    @engine.item_repository.find_all_by_merchant_id(@id)
  end

  def invoices
    @engine.invoice_repository.find_all_by_merchant_id(@id)
  end

  def revenue(x= 1)
    invoice_ids = invoices.map{|invoice| invoice.id}
    invoice_ids.map do |invoice_id|
      items = @engine.invoice_item_repository.find_all_by_invoice_id(invoice_id)
      items = items.reduce(0) {|sum, item| (item.unit_price * item.quantity) + sum }
    end
    #returns the total revenue for that merchant across all transactions
    #returns the total revenue for that merchant for a specific invoice date
  end

  def favorite_customer
    #returns the Customer who has conducted the most successful transactions
  end

  def customers_with_pending_invoices
    all_failed_transactions = @engine.transaction_repository.find_all_by_result("failed")

    successful_transactions_invoice_ids = @engine.transaction_repository.find_all_by_result("success").map{|transaction| transaction.invoice_id}
    failed_transactions = all_failed_transactions.reject{|transaction| successful_transactions_invoice_ids.include?(transaction.invoice_id)}

    failed_transactions_invoices_ids = failed_transactions.map{|transaction| transaction.invoice_id}
    failed_transactions_customers = failed_transactions_invoices_ids.map do |invoice_id|
      @engine.invoice_repository.find_by_id(invoice_id)
    end
  end

end
