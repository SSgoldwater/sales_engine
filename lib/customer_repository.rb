require_relative "./customer_parser.rb"
require_relative "./customer.rb"
require 'pry'

class CustomerRepository

  def initialize(filename= "./test/support/customers.csv", engine)
    @engine = engine
    parser = CustomerParser.new(filename, @engine)
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
    @file.detect{|customer| customer.id == id_num.to_s}
  end

  def find_by_first_name(first_name = "cecelia")
    @file.detect{|customer| customer.first_name.downcase == first_name.downcase}
  end

  def find_by_last_name(last_name = "osinski")
    @file.detect{|customer| customer.last_name.downcase == last_name.downcase}
  end

  def find_all_by_first_name(first_name = "cecelia")
    @file.select{|customer| customer.first_name.downcase == first_name.downcase}
  end

  def find_all_by_last_name(last_name = "nader")
    @file.select{|customer| customer.last_name.downcase == last_name.downcase}
  end

end
