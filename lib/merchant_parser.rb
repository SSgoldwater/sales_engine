require 'csv'
require 'pry'

class MerchantParser
  attr_reader :filename

  def initialize(filename, engine)
    @engine = engine
    @filename = filename
  end

  def parse
    file = CSV.open(@filename, :headers => true, :header_converters => :symbol)
    # binding.pry
    file.map do |line|
      Merchant.new(line, @engine)
    end
  end

end
