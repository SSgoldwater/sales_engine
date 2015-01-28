require_relative "./item_parser.rb"
require_relative "./item.rb"

require 'pry'
require 'csv'
require 'bigdecimal'


class ItemRepository

  def initialize(filename= "./test/support/customers_test.csv", engine)
    @engine = engine
    parser = ItemParser.new(filename, engine)
    @file = parser.parse
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def random
    @file.sample
  end

  def find_by_id(id_num = nil)
    @file.each do |item|
      if item.id == id_num
        return item
      end
    end
  end

  def find_by_unit_price(unit_price)
    @file.each do |item|
      if item.unit_price.split[1] == unit_price.split[1]
        return item
      end
    end
  end

  def find_by_name(item_name)
    @file.each do |item|
      if item.name == item_name
        return item
      end
    end
  end

  def find_all_by_merchant_id(merchant_id)
    items = []
    @file.each do |item|
      if item.merchant_id == merchant_id
        items << item
      end
    end
    items
  end

  def find_all_by_name(item_name)
    items = []
    @file.each do |item|
      if item.name == item_name
        items << item
      end
    end
    items
  end



end

# id,name,description,unit_price,merchant_id,created_at,updated_at
# 1,Item Qui Esse,Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.,75107,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
# 2,Item Autem Minima,Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.,67076,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
# 3,Item Ea Voluptatum,Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.,32301,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
# 4,Item Nemo Facere,Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.,4291,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
# 5,Item Expedita Aliquam,Voluptate aut labore qui illum tempore eius. Corrupti cum et rerum. Enim illum labore voluptatem dicta consequatur. Consequatur sunt consequuntur ut officiis.,68723,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
