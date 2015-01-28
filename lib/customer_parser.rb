require 'csv'
require 'pry'

class CustomerParser
  attr_reader :filename, :id

  def initialize(filename, engine)
    @engine = engine
    @filename = filename
  end

  def parse
    file = CSV.open(@filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Customer.new(line, @engine)
    end
  end

end
