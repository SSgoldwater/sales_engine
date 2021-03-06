require 'pry'
require 'csv'

class Transaction
  attr_reader :id, :invoice_id, :credit_card_number, :result

  def initialize(data, engine)
    @engine = engine
    @id = data[:id].to_i
    @invoice_id = data[:invoice_id].to_i
    @credit_card_number = data[:credit_card_number].to_i
    @result = data[:result]
  end

  def invoice
    @engine.invoice_repository.find_by_id(@invoice_id)
  end

  def customer_id
    @engine.customer_repository
  end

end
