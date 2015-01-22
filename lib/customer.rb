require 'pry'
require 'csv'


class Customer
  attr_reader :id, :first_name, :last_name

  def initialize(data_line, parent)
    @id = data_line[:id].to_i
    @first_name = data_line[:first_name]
    @last_name = data_line[:last_name]
  end

end
