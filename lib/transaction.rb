require 'pry'
require 'csv'


class Transaction
  attr_reader :invoice_id, :credit_card_number, :result

  def initialize(data, parent)
    @invoice_id = data[:invoice_id].to_i
    @credit_card_number = data[:credit_card_number].to_i
    @result = data[:result]
  end

end
