require_relative './invoice_item_parser.rb'
require_relative './invoice_item.rb'
require 'pry'


class InvoiceItemRepository

  def initialize(filename= "./test/support/invoice_items_test.csv")
    parser = InvoiceItemParser.new(filename)
    @file = parser.parse
  end

  def all
    all = []
    @file.each do |invoice_item|
      all << "ID: #{invoice_item.id}, ITEM ID: #{invoice_item.item_id}, INVOICE ID: #{invoice_item.invoice_id}, QUANTITY: #{invoice_item.quantity}, UNIT PRICE: #{invoice_item.unit_price}"
    end
    all
  end

  def random
    random_invoice_item = @file.sample
    "ID: #{random_invoice_item.id}, ITEM ID: #{random_invoice_item.item_id}, INVOICE ID: #{random_invoice_item.invoice_id}, QUANTITY: #{random_invoice_item.quantity}, UNIT PRICE: #{random_invoice_item.unit_price}"
  end

  def find_by_id(id_num = nil)
    @file.each do |invoice_item|
      if invoice_item.id == id_num
        return "ID: #{invoice_item.id}, ITEM ID: #{invoice_item.item_id}, INVOICE ID: #{invoice_item.invoice_id}, QUANTITY: #{invoice_item.quantity}, UNIT PRICE: #{invoice_item.unit_price}"
      end
    end
  end

  def find_by_item_id(item_id = nil)
    @file.each do |invoice_item|
      if invoice_item.item_id == item_id
        return "ID: #{invoice_item.id}, ITEM ID: #{invoice_item.item_id}, INVOICE ID: #{invoice_item.invoice_id}, QUANTITY: #{invoice_item.quantity}, UNIT PRICE: #{invoice_item.unit_price}"
      end
    end
  end

  def find_all_by_item_id(item_id)
    invoice_items = []
    @file.each do |invoice_item|
      if invoice_item.item_id == item_id
        invoice_items << "ID: #{invoice_item.id}, ITEM ID: #{invoice_item.item_id}, INVOICE ID: #{invoice_item.invoice_id}, QUANTITY: #{invoice_item.quantity}, UNIT PRICE: #{invoice_item.unit_price}"
      end
    end
    invoice_items
  end

end
