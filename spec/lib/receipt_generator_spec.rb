describe ReceiptGenerator do 
  describe '#generate' do 
    context 'given a list of items and the total sales tax' do
      it 'prints receipt details' do 
        input_file_name = 'input/shopping_basket3.csv'
        line_items = CsvParser.new(input_file_name).read
        total_taxable_amount = BigDecimal('6.7')

        receipt_generator = ReceiptGenerator.new
        
        expect{ receipt_generator.generate(line_items,total_taxable_amount) }.to output(receipt_summary).to_stdout
      end
    end
  end
end


def receipt_summary
  <<~PURCHASE_DETAILS
    1, imported bottle of perfume, 27.99
    1, bottle of perfume, 18.99
    1, packet of headache pills, 9.75
    1, imported box of chocolates, 11.25
    
    Sales Taxes: 6.7
    Total: 67.98
  PURCHASE_DETAILS
end