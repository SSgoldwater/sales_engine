require_relative './transaction_parser.rb'
require_relative './transaction.rb'
require 'pry'
require 'csv'


class TransactionRepository

  def initialize(filename = "./test/support/transactions_test.csv", engine)
    parser = TransactionParser.new(filename, engine)
    @file = parser.parse
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end


  def all
    all = []
    @file.each do |transaction|
      all << transaction
    end
    all
  end

  def random
    @file.sample
  end

  def find_by_id(id_num = nil)
    @file.each do |transaction|
      if transaction.id == id_num
        return transaction
      end
    end
  end

  def find_by_invoice_id(invoice_num = nil)
    @file.each do |transaction|
      # binding.pry
      if transaction.invoice_id == invoice_num
        # binding.pry
        return transaction
      end
    end
  end

  def find_by_credit_card_number(credit_card_number)
    @file.each do |transaction|
      # binding.pry
      if transaction.credit_card_number == credit_card_number.to_i
        return transaction
      end
    end
  end

  def find_all_by_result(result = nil)
    results = []
    @file.each do |transaction|
      if transaction.result == result
        results << "ID: #{transaction.id}, INVOICE_ID: #{transaction.invoice_id}, CREDIT_CARD_NUMBER: #{transaction.credit_card_number}, RESULT: #{transaction.result}"
      end
    end
    results
  end

  def find_all_by_invoice_id(invoice_id)
    transactions = []
    @file.each do |transaction|
      if transaction.invoice_id == invoice_id
        transactions << transaction
      end
    end
    transactions
  end

  def find_all_by_customer_id
  end

end
