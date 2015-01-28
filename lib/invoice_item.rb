require 'pry'
require 'csv'


class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price

  def initialize(data, engine)
    @engine = engine
    @id = data[:id].to_i
    @item_id = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity = data[:quantity].to_i
    @unit_price = data[:unit_price].to_i

  end

  def item
    @engine.item_repository.find_by_id(@item_id)
  end

  def invoice
    @engine.invoice_repository.find_by_id(@invoice_id)
  end

  def name
    @engine.item_repository.find_by_id(@item_id)
    
  end

end
