class ShoppingCart
  attr_reader :items_list, :tax_calculator, :receipt_generator

  def initialize(items_list, tax_calculator, receipt_generator)
    @items = items_list,
    @tax_calculator = tax_calculator, 
    @receipt_generator = receipt_generator
  end

  def purchase_items
    total_taxable_amount = 0
    items_list_with_price_including_tax = []
    
    @items.first.each do |item|
      item_price_including_tax, total_sales_tax_on_item = tax_calculator.calculate_tax(item)
      total_taxable_amount += apply_tax_for_n_items_of_a_product(total_sales_tax_on_item, item.quantity)
      total_cost_of_a_product = total_cost_for_n_items(item_price_including_tax, item.quantity)
      items_list_with_price_including_tax << LineItem.new(item.name, total_cost_of_a_product, item.type, item.quantity)
    end
    receipt_generator.generate(items_list_with_price_including_tax, total_taxable_amount)
  end

  private

  def apply_tax_for_n_items_of_a_product(total_sales_tax_on_item, item_quantity)
    total_sales_tax_on_item * item_quantity
  end

  def total_cost_for_n_items(item_price_including_tax, item_quantity)
    item_price_including_tax * item_quantity
  end

end