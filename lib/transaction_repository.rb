require_relative './transaction_parser.rb'
require_relative './transaction.rb'
require 'pry'
require 'csv'

class TransactionRepository

  def initialize(filename = "./test/support/transactions.csv", engine)
    parser = TransactionParser.new(filename, engine)
    @file = parser.parse
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def all
    @file
  end

  def random
    @file.sample
  end

  def find_by_id(id_num= 1)
    @file.detect{|transaction| transaction.id == id_num}
  end

  def find_by_invoice_id(invoice_id= 1)
    @file.detect{|transaction| transaction.invoice_id == invoice_id}
  end

  def find_by_credit_card_number(credit_card_number= 4654405418249632)
    @file.detect{|transaction| transaction.credit_card_number == credit_card_number.to_i}
  end

  def find_all_by_invoice_id(invoice_id= 1)
    @file.select{|transaction| transaction.invoice_id == invoice_id}
  end

  def find_all_by_customer_id(customer_id= 1)
    @file.select{|transaction| transaction.customer_id == customer_id}
  end

  def find_all_by_credit_card_number(card_number= 4654405418249632)
    @file.select{|transaction| transaction.credit_card_number == card_number}
  end

  def find_all_by_result(result = "shipped")
    @file.select{|transaction| transaction.result == result}
  end

end
