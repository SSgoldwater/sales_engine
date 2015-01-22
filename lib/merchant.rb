require 'pry'


class Merchant
  attr_reader :id, :name

  def initialize(data_line, parent)
    @id = data_line[:id].to_i
    @name = data_line[:name]
  end

end
