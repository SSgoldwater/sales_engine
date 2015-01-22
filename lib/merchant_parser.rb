require 'csv'
require 'pry'

class MerchantParser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    file = CSV.open(@filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Merchant.new(line, nil)
    end
  end

end
