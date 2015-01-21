require 'pry'
require 'csv'


class MerchantRepository

  def initialize

  end

  def all
    csv = CSV.open('./data/merchants_test.csv')
    contents = []
    csv.each do |line|
      contents << line
    end
    contents
  end



  def random
    csv = CSV.open('./data/merchants_test.csv')
    contents = []
    csv.each do |line|
      contents << line
    end
    contents.sample
  end





end
