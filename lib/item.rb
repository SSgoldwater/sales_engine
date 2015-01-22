require 'pry'
require 'csv'


class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id

  def initialize(data_line, parent)
    @id = data_line[:id].to_i
    @name = data_line[:name]
    @description = data_line[:description]
    @unit_price = data_line[:unit_price].to_i
    @merchant_id = data_line[:merchant_id].to_i
  end

end
