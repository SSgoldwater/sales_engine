require_relative "./merchant_parser.rb"
require_relative "./merchant.rb"
require 'pry'


class MerchantRepository

  def initialize(filename= "./test/support/merchants_test.csv")
    parser = MerchantParser.new(filename)
    @file = parser.parse
  end

  def all
    all = []
    @file.each do |merchant|
      all << "NAME: #{merchant.name}, ID: #{merchant.id}"
    end
    all
  end

  def random
    random_merchant = @file.sample
    "NAME: #{random_merchant.name}, ID: #{random_merchant.id}"
  end

  def find_by_id(id_num= nil)
    @file.each do |merchant|
      if merchant.id == id_num
        return "NAME: #{merchant.name}, ID: #{merchant.id}"
      end
    end
  end


  def find_by_name(name = nil)
    @file.each do |merchant|
      if merchant.name.downcase == name.downcase
        return "NAME: #{merchant.name}, ID: #{merchant.id}"
      end
    end
  end

  def find_all_by_name(name)
    names = []
    @file.each do |merchant|
      if merchant.name.downcase == name.downcase
        names << "NAME: #{merchant.name}, ID: #{merchant.id}"
      end
    end
    names
  end

end
