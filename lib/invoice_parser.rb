require 'csv'
require 'pry'

class InvoiceParser
  attr_reader :filename

  def initialize(filename, engine)
    @engine = engine
    @filename = filename
  end

  def parse
    file = CSV.open(@filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Invoice.new(line, @engine)
    end
  end
end
