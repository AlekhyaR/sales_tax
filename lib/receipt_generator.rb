class ReceiptGenerator
  def generator(items_list, total_taxable_amount)
    total = 0
    items_list.each do |item|
      puts "#{item.quantity}, #{item.name}, #{format_number_to_floating_point(item.price)}\n"
      total_cost += item.price
    end

    puts "\nTaxable Amonut: #{format_number_to_floating_point(total_taxable_amount)}"
    puts "Total: #{format_number_to_floating_point(total_cost)}"
  end

  private

    def format_number_to_floating_point(number)
      number.to_s('F')
    end

end
