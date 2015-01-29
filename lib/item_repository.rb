require_relative "./item_parser.rb"
require_relative "./item.rb"

require 'pry'
require 'csv'
require 'bigdecimal'


class ItemRepository

  def initialize(filename= "./test/support/customers_test.csv", engine)
    @engine = engine
    parser = ItemParser.new(filename, engine)
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

  def find_by_id(item_id = 1)
    @file.detect{|item| item.id == item_id}
  end

  def find_by_name(item_name= "Item Qui Esse")
    @file.detect{|item| item.name == item_name}
  end

  def find_by_unit_price(unit_price = "67076")
    # @file.detect{|item| item.unit_price.split[1] == unit_price.split[1]}
    @file.each do |item|
      if item.unit_price.split[1] == unit_price.split[1]
        return item
      end
    end
  end

  def find_by_merchant_id(merchant_id = 1)
    @file.detect{|item| item.merchant_id == merchant_id}
  end

  def find_by_description(item_description = "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.")
    @file.detect{|item| item.description == item_description}
  end

  def find_all_by_unit_price(unit_price= 67076)
    true
  end

  def find_all_by_merchant_id(merchant_id= 2)
    @file.select{|item| item.merchant_id == merchant_id}
  end

  def find_all_by_name(item_name = "Item Qui Esse")
    @file.select{|item| item.name == item_name}
  end

  def most_revenue(x= 1)
    #returns the top x item instances ranked by total revenue generated
  end

  def most_items(x= 1)
    #returns the top x item instances ranked by total number sold
  end

end
