require 'csv'
require 'pry'

class TransactionParser
  attr_reader :filename

  def initialize(filename, engine)
    @engine = engine
    @filename = filename
  end

  def parse
    file = CSV.open(@filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Transaction.new(line, @engine)
    end

  end



end
