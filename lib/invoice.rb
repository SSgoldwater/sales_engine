require 'pry'
require 'csv'


class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status

  def initialize(data_line, parent)
    @id = data_line[:id].to_i
    @customer_id = data_line[:customer_id].to_i
    @merchant_id = data_line[:merchant_id].to_i
    @status = data_line[:status]
  end

end
