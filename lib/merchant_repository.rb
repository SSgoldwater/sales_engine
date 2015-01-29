require_relative "./merchant_parser.rb"
require_relative "./merchant.rb"
require 'pry'


class MerchantRepository
  def initialize(filename= "./test/support/merchants_test.csv", engine)
    parser = MerchantParser.new(filename, engine)
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
    @file.detect{|merchant| merchant.id == id_num}
  end

  def find_by_name(name = "willms and sons")
    @file.detect{|merchant| merchant.name.downcase == name.downcase}
  end

  def find_all_by_name(name)
    @file.select{|merchant| merchant.name.downcase == name.downcase}
   end

  def most_revenue(x= 1)
    #returns the top x merchant instances ranked by total revenue
  end

  def most_items(x= 1)
    #returns the top x merchant instances ranked by total number of items sold
  end

  def revenue(date)
    #returns the total revenue for that date across all merchants
  end
  
end
