require_relative '../lib/shopping_cart.rb'
require_relative '../lib/line_item.rb'
require_relative '../lib/receipt_generator.rb'
require_relative '../lib/tax_calculator.rb'
require_relative '../lib/csv_parser.rb'


def file_not_found_message
end

file_name = "input/#{ARGV.first}"
raise file_not_found_message unless File.exists?(file_name)

line_items = CsvParser.new(file_name).read
shopping_cart = ShoppingCart.new(line_items, TaxCalculator.new, ReceiptGenerator.new)
shopping_cart.purchase_items