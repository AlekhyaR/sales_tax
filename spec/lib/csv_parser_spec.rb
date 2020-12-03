describe CsvParser do 
  describe '#read' do 
    context 'given a csv' do 
      it 'returns a collection of lineitems with removed whitespaces for each value of the csv' do
        file_name = 'input/shopping_basket2.csv'
        products = CsvParser.new(file_name).read
        line_items = [LineItem.new('imported box of chocolates', BigDecimal('10.00'), 1),
                      LineItem.new('imported bottle of perfume', BigDecimal('47.50'), 1)]

        expect(products.first.name).to eq(line_items.first.name)
        expect(products.first.quantity).to eq(line_items.first.quantity)
        expect(products.first.price).to eq(line_items.first.price)
      end
    end
  end
end
  