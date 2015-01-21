require 'pry'



class MerchantRepository

  def initialize

  end

  def all
    csv = CSV.open('./test/support/merchants_test.csv')
    contents = []
    csv.each do |line|
      contents << line
    end
    contents
  end


  def random
    csv = CSV.open('./test/support/merchants_test.csv')
    contents = []
    csv.each do |line|
      contents << line
    end
    contents.sample
  end





end
