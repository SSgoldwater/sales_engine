require 'csv'
require 'pry'

class CustomerParser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    file = CSV.open(@filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Customer.new(line, nil)
    end
  end

end
