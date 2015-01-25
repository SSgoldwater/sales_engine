require 'pry'
require 'csv'


class TransactionRepository

  def initialize(filename = "./test/support/transactions_test.csv")
    parser = TransactionParser.new(filename)
    @file = parser.parse
  end

  def all
    all = []
    @file.each do |transaction|
      all << "ID: #{transaction.id}, INVOICE_ID: #{transaction.invoice_id}, CREDIT_CARD_NUMBER: #{transaction.credit_card_number}, RESULT: #{transaction.result}"
    end
    all
  end

  def random
    random_transaction = @file.sample
    "ID: #{random_transaction.id}, INVOICE_ID: #{random_transaction.invoice_id}, CREDIT_CARD_NUMBER: #{random_transaction.credit_card_number}, RESULT: #{random_transaction.result}"
  end

  def find_by_id(id_num = nil)
    @file.each do |transaction|
      if transaction.id == id_num
        return "ID: #{transaction.id}, INVOICE_ID: #{transaction.invoice_id}, CREDIT_CARD_NUMBER: #{transaction.credit_card_number}, RESULT: #{transaction.result}"
      end
    end
  end

  def find_by_invoice_id(invoice_num = nil)
    @file.each do |transaction|
      if transaction.invoice_id == invoice_num
        return "ID: #{transaction.id}, INVOICE_ID: #{transaction.invoice_id}, CREDIT_CARD_NUMBER: #{transaction.credit_card_number}, RESULT: #{transaction.result}"
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


end
