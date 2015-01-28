require 'pry'
require 'csv'
require 'bigdecimal'


class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id

  def initialize(data_line, engine)
    @engine = engine
    @id = data_line[:id].to_i
    @name = data_line[:name]
    @description = data_line[:description]
    @unit_price = BigDecimal.new(data_line[:unit_price])
    @merchant_id = data_line[:merchant_id].to_i

  end


  def invoice_items
    @engine.invoice_item_repository.find_all_by_item_id(@id)
  end

  def merchant
    @engine.merchant_repository.find_by_id(@merchant_id)
  end
  
end
