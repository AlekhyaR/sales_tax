describe ShoppingCart do
  describe '#purchase_items' do
    context 'given a list of items, a tax calulator and a receipt generator' do
      it 'calculates costs related to the items in cart and generates a sales receipt' do
        file_name = 'input/shopping_basket3.csv'
        line_items = CsvParser.new(file_name).read

        shopping_cart = ShoppingCart.new(line_items, TaxCalculator.new, ReceiptGenerator.new)
        expect {shopping_cart.purchase_items}.to output(purchase_receipt).to_stdout
      end
    end
  end 
end

def purchase_receipt
  <<~PURCHASE_DETAILS
    1, imported bottle of perfume, cosmetic, 32.19
    1, bottle of perfume, cosmetic, 20.89
    1, packet of headache pills, medicine, 9.75
    1, imported box of chocolates, food, 11.85

    Taxable Amount: 6.7
    Total: 74.68
  PURCHASE_DETAILS
end