require_relative '../lib/shopping_cart.rb'
require_relative '../lib/line_item.rb'
require_relative '../lib/receipt_generator.rb'
require_relative '../lib/tax_calculator.rb'
require_relative '../lib/csv_parser.rb'


def file_not_found_message
  <<~FILE_NOT_FOUND_MESSAGE
    The file name you've specified is not found. Please navigate your way to the input directory
    from the projects root folder to look at the available files one can use.
    If you'd like to add a new CSV file, please do add them in the same location as mentioned above
    and try to rerun the same command with the new file name. Please note you only have to specify the file name
    in your command and this will be automatically picked up from within the input directory.
  FILE_NOT_FOUND_MESSAGE
end

file_name = "input/#{ARGV.first}"
raise file_not_found_message unless File.exists?(file_name)

line_items = CsvParser.new(file_name).read
shopping_cart = ShoppingCart.new(line_items, TaxCalculator.new, ReceiptGenerator.new)
shopping_cart.purchase_items