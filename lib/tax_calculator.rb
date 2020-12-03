require 'bigdecimal'

class TaxCalculator

  IMPORTED = 'imported'
  IMPORT_DUTY_TAX_VALUE = (1/BigDecimal(20)).freeze
  BASIC_SALES_TAX_VALUE = (1/BigDecimal(10)).freeze
  ROUND_OFF_TO_A_NUMBER_TO = (1/BigDecimal(20)).freeze
  ITEMS_EXEMPT_FROM_BASIC_SALES_TAX = { books: ['book'],
                                        food: %w[chocolate chocolates],
                                        medical_products: ['pills'] }.freeze

  def calculate_tax(item)
    total_sales_tax_on_item = calculate_sales_tax(item)
    item_price_including_tax = item.price + total_sales_tax_on_item
    [item_price_including_tax, total_sales_tax_on_item]
  end

  private

  def imported_good?(item)
    item.name.include? IMPORTED
  end

  def zero_tax_imposed
    BigDecimal(0)
  end

  def basic_sales_tax_is_applicable?(name)
    !ITEMS_EXEMPT_FROM_BASIC_SALES_TAX.values.flatten.any? { |word| name.include?(word) }
  end

  def calculate_sales_tax(item)
    basic_sales_tax = calculate_basic_sales_tax(item)
    import_duty_sales_tax = calculate_import_duty_tax(item)
    total_sales_tax_on_item(basic_sales_tax, import_duty_sales_tax)
  end

  def calculate_basic_sales_tax(item)
    return zero_tax_imposed unless basic_sales_tax_is_applicable?(item.name)
    round_up_to_the_nearest_number(item.price * BASIC_SALES_TAX_VALUE)
  end

  def calculate_import_duty_tax(item)
    return zero_tax_imposed unless imported_good?(item)
    round_up_to_the_nearest_number(item.price * IMPORT_DUTY_TAX_VALUE)
  end

  def round_up_to_the_nearest_number(price)
    (price / ROUND_OFF_TO_A_NUMBER_TO).ceil * ROUND_OFF_TO_A_NUMBER_TO
  end

  def total_sales_tax_on_item(basic_sales_tax, import_duty_sales_tax)
    basic_sales_tax + import_duty_sales_tax
  end
end