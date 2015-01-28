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

    @engine.merchant_repository.each do |merchant|
      # binding.pry
    end

  end

end
