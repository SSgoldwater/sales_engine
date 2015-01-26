require_relative "./customer_parser.rb"
require_relative "./customer.rb"
require 'pry'


class CustomerRepository

  def initialize(filename= "./test/support/customers_test.csv")
    parser = CustomerParser.new(filename)
    @file = parser.parse
  end

  def all
    all = []
    @file.each do |customer|
      all << "NAME: #{customer.first_name} #{customer.last_name}, ID: #{customer.id}"
    end
    all
  end

  def random
    random_customer = @file.sample
    "NAME: #{random_customer.first_name} #{random_customer.last_name}, ID: #{random_customer.id}"
  end

  def find_by_id(id_num = nil)
    @file.each do |customer|
      if customer.id == id_num
        return "NAME: #{customer.first_name} #{customer.last_name}, ID: #{customer.id}"
      end
    end
  end

  def find_by_name(name = nil)
    @file.each do |customer|
      if customer.first_name.downcase + " " + customer.last_name.downcase == name.downcase
        return "NAME: #{customer.first_name} #{customer.last_name}, ID: #{customer.id}"
      end
    end
  end

  def find_all_by_name(name)
    names = []
    @file.each do |customer|
      if customer.first_name.downcase + " " + customer.last_name.downcase == name.downcase
        names << "NAME: #{customer.first_name} #{customer.last_name}, ID: #{customer.id}"
      end
    end
      names
  end

end
