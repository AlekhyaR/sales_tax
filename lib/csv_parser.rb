require 'csv'

class CsvParser
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def read
    row_details = []
    CSV.foreach(file_name, headers: true, 
                           header_converters: -> (value) {value.strip},
                           converters: -> (value) {value.strip}) do |row|
      row_details << LineItem.new(row['Product'], BigDecimal.new(row['Price']), row['Type'], row['Quantity'].to_i)
    end
    row_details
  end

end