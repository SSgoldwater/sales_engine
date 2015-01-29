require_relative "./invoice_parser.rb"
require_relative "./invoice.rb"
require 'pry'
require 'csv'

class InvoiceRepository

  def initialize(filename = "./test/support/invoices_test.csv", engine)
    @engine = engine
    parser = InvoiceParser.new(filename, @engine)
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

  def find_by_id(id_num = 1)
    @file.detect{|invoice| invoice.id == id_num}
  end

  def find_by_status(status)
    @file.detect{|invoice| invoice.status == status}
  end

  def find_all_by_customer_id(customer_id = 3)
    @file.select{|invoice| invoice.customer_id == customer_id}
  end

  def find_all_by_merchant_id(merchant_id= 33)
    @file.select{|invoice| invoice.merchant_id == merchant_id}
  end

  def find_all_by_status(status= "shipped")
    @file.select{|invoice| invoice.status == status}
  end

  def get_merchant_invoices_by_customer_id(customer_id)
    @file.select{|invoice| invoice.customer_id == customer_id.to_i}
  end

end
