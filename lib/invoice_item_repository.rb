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
    all = []
    @file.each do |invoice_item|
      all << invoice_item
    end
    all
  end

  def random
    @file.sample
  end

  def find_by_id(id_num = nil)
    @file.each do |invoice_item|
      if invoice_item.id == id_num
        return invoice_item
      end
    end
  end

  def find_by_item_id(item_id = nil)
    @file.each do |invoice_item|
      if invoice_item.item_id == item_id
        # binding.pry
        return invoice_item
      end
    end
  end

  def find_all_by_item_id(item_id)
    invoice_items = []
    @file.each do |invoice_item|
      if invoice_item.item_id == item_id
        invoice_items << invoice_item
      end
    end
    invoice_items
  end

  def find_all_by_invoice_id(invoice_id)
    invoice_items = []
    @file.each do |invoice_item|
      if invoice_item.invoice_id == invoice_id
        invoice_items << invoice_item
      end
    end
    invoice_items
  end

  def find_all_by_quantity(quantity)
    invoice_items = []
    @file.each do |invoice_item|
      if invoice_item.quantity == quantity
        invoice_items << invoice_item
      end
    end
    invoice_items
  end

end
