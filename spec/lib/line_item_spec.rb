describe LineItem do
  describe '#initialize' do
    it 'it determines whether lineitem is imported and sets related attributes' do
      line_item = LineItem.new('imported box of chocolates', BigDecimal("10"), 1)
      expect({name:line_item.name, quantity:line_item.quantity}).to eq({name:'imported box of chocolates',quantity: 1})
    end
  end
end