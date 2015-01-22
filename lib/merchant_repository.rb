require_relative "./merchant_parser.rb"
require 'pry'



class MerchantRepository

  def initialize(filename= "./test/support/merchants_test.csv")
    @parser = MerchantParser.new(filename)
  end

  def all
    file = @parser.parse
    all = []
    file.each do |merchant|
      all << "NAME: #{merchant.name}, ID: #{merchant.id}"
    end
    all
  end

  def random
    file = @parser.parse
    random_merchant = file.sample
    "NAME: #{random_merchant.name}, ID: #{random_merchant.id}"
  end



end
