require 'pry'
require 'csv'

# "1,1,26,shipped", "2,1,75,shipped", "3,1,78,shipped", "4,1,33,shipped"

class InvoiceRepository

  def initialize(filename = "./test/support/invoices_test.csv")
    parser = InvoiceParser.new(filename)
    @file = parser.parse
  end

  def all
    all = []
    @file.each do |invoice|
      all << "ID: #{invoice.id}, CUSTOMER: #{invoice.customer_id}, MERCHANT: #{invoice.merchant_id}, STATUS: #{invoice.status}"
    end
    all
  end

  def random
    random_invoice = @file.sample
  end

  def find_by_id(id_num = nil)
    @file.each do |invoice|
      if invoice.id == id_num
        return "ID: #{invoice.id}, CUSTOMER: #{invoice.customer_id}, MERCHANT: #{invoice.merchant_id}, STATUS: #{invoice.status}"
      end
    end
  end

  def find_by_customer_id(customer = nil)
    @file.each do |invoice|
      if invoice.customer_id == customer
        return "ID: #{invoice.id}, CUSTOMER: #{invoice.customer_id}, MERCHANT: #{invoice.merchant_id}, STATUS: #{invoice.status}"
      end
    end
  end

  def find_all_by_customer_id(customer = nil)
    customers = []
    @file.each do |invoice|
      if invoice.customer_id == customer
        customers << "ID: #{invoice.id}, CUSTOMER: #{invoice.customer_id}, MERCHANT: #{invoice.merchant_id}, STATUS: #{invoice.status}"
      end
    end
    customers
  end

end
