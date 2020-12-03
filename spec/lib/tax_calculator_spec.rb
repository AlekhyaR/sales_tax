describe TaxCalculator do
  describe '#calculate_tax' do
    context 'given item contain certain details' do
      it 'calculates item price including tax and total sales tax of an item' do
        item = LineItem.new('imported bottle of perfume', BigDecimal('27.99'), 1)
        
        tax_calculator = TaxCalculator.new

        expect(tax_calculator.calculate_tax(item)).to match_array([0.3219e2, 0.42e1])
      end
    end
  end
end