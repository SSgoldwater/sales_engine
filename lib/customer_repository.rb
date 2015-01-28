require_relative "./customer_parser.rb"
require_relative "./customer.rb"
require 'pry'


class CustomerRepository

  def initialize(filename= "./test/support/customers_test.csv", engine)
    @engine = engine
    parser = CustomerParser.new(filename, @engine)
    @file = parser.parse
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end


  def all
    all = []
    @file.each do |customer|
      all << customer
    end
    all
  end

  def random
    @file.sample
  end

  def find_by_id(id_num = nil)
    @file.each do |customer|
      if customer.id == id_num.to_s
        return customer
      end
    end
  end

  def find_by_last_name(last_name = nil)
    @file.each do |customer|
      if customer.last_name.downcase == last_name.downcase
        return customer
      end
    end
  end

  def find_all_by_first_name(first_name = nil)
    names = []
    @file.each do |customer|
      if customer.first_name.downcase == first_name.downcase
        names << customer
      end
    end
      names
  end



end
