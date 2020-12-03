require 'bigdecimal'

class TaxCalculator

  IMPORTED = 'imported'
  IMPORT_DUTY_TAX_VALUE = (1/BigDecimal(20)).freeze
  BASIC_SALES_TAX_VALUE = (1/BigDecimal(10)).freeze
  ROUND_OFF_TO_A_NUMBER_TO = (1/BigDecimal(20)).freeze
  TYPE_OF_GOODS_EXEMPTED_UNDER_TAX = %w{book food medicine}

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

  def calculate_sales_tax(item)
    basic_sales_tax = calculate_basic_sales_tax(item)
    import_duty_sales_tax = calculate_import_duty_tax(item)
    total_sales_tax_on_item(basic_sales_tax, import_duty_sales_tax)
  end

  def calculate_basic_sales_tax(item)
    return zero_tax_imposed if TYPE_OF_GOODS_EXEMPTED_UNDER_TAX.include?(item.type)
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