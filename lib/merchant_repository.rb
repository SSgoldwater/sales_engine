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
    all = []
    @file.each do |merchant|
      all << merchant
    end
    all
  end

  def random
    @file.sample
  end

  def find_by_id(id_num= nil)
    @file.each do |merchant|
      if merchant.id == id_num
        return merchant
      end
    end
  end


  def find_by_name(name = nil)
    @file.each do |merchant|
      if merchant.name.downcase == name.downcase
        return merchant
      end
    end
  end

  def find_all_by_name(name)
    names = []
    @file.each do |merchant|
      if merchant.name.downcase == name.downcase
        names << merchant
      end
    end
    names
  end


end
