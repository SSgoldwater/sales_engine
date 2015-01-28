require 'pry'



class Merchant
  attr_reader :id, :name

  def initialize(data_line, engine)
    @engine = engine
    @id = data_line[:id].to_i
    @name = data_line[:name]
  end

  def items
    @engine.item_repository.find_all_by_merchant_id(@id)
  end

  def invoices
    @engine.invoice_repository.find_all_by_merchant_id(@id)
  end

end
