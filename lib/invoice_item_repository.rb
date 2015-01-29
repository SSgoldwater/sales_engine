require_relative './invoice_item_parser.rb'
require_relative './invoice_item.rb'
require 'pry'

class InvoiceItemRepository

  def initialize(filename= "./test/support/invoice_items_test.csv", engine)
    @engine = engine
    parser = InvoiceItemParser.new(filename, @engine)
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
    @file.detect{|invoice_item| invoice_item.id == id_num}
  end

  def find_by_item_id(item_id= 539)
    @file.detect{|invoice_item| invoice_item.item_id == item_id}
  end

  def find_by_invoice_id(invoice_id= 1)
    @file.detect{|invoice_item| invoice_item.invoice_id == invoice_id}
  end

  def find_all_by_item_id(item_id= 539)
    @file.select{|invoice_item| invoice_item.item_id == item_id}
  end

  def find_all_by_invoice_id(invoice_id= 1)
    @file.select{|invoice_item| invoice_item.invoice_id == invoice_id}
  end

  def find_all_by_quantity(quantity)
    @file.select{|invoice_item| invoice_item.quantity == quantity}
  end

end
