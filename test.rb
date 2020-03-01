require "byebug"

class Item
  attr_reader :item_name, :quantity, :supplier_name, :price
  def initialize(item_name, quantity, supplier_name, price)
    @item_name = item_name
    @quantity = quantity
    @supplier_name = supplier_name
    @price = price
  end
  def ==(other_item)
    @item_name == other_item.item_name &&
    @quantity == other_item.quantity &&
    @supplier_name == other_item.supplier_name &&
    @price == other_item.price
  end
  def eql?(other_item)
    self == other_item
  end
  def hash
    @item_name.hash ^ @quantity.hash ^ @supplier_name.hash ^ @price.hash
  end
end
byebug
item = Item.new(2, 100, "Ada", 100)

puts item.hash
