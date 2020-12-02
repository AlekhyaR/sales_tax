class LineItem
  attr_reader :name, :price, :type, :quantity
  
  def initialize(name, price, type, quantity)
    @item_name = name
    @price = price
    @type = type
    @quantity = quantity
  end

  
end