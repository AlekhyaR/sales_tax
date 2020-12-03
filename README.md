Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt that lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets. The output should be to standard out or CSV.

Proper architecture design is important. Each row in the input represents a line item of the receipt.

Initially dividing the task into subtask at given point of time.
1. Identify imported goods, should return boolean
2. Identify good type and exempt from basic sales tax
3. Calculate 10% of goods price and add it to price
4. Calculate imported duty sales tax
5. To read Csv file check supporting gem
6. Save the inputs to one folder, to use it in executing the program
7. Print receipt pass array of values as argument -> Print standard out as output
8. Each row represents lineitem, store each item as line items
9. Receipt contains all items, their prices(including taxes), output Sales taxes and total amount

## About


Based on the [given problem statement](https://github.com/alekhyaR/sales_tax/blob/master/problem_statement.md) this is a program that calculates sales tax and prints out a receipt which has the pricing details(including tax) related to the purchase of each item. One can **read more about design decisions** based on which how this app is built from [this section](https://github.com/alekhyaR/sales_tax/blob/master/README.md#code-related-design-decisions). You can see how a *purchase receipt* looks like from [the sample program output section](https://github.com/alekhyaR/sales_tax/blob/master/README.md#program-output).

## Code related design decisions

* The entities related to the problem domain are - Line Item, Receipt, Shopping Cart and  Tax Calculator
* A shopping cart has - line items, a tax calculator and a receipt generator. They satisfy the **"has_a"** relationship hence I've **made use of composition** in appropriate places.

![Composition](images/sales_tax_composition.png)

* Have made use of `BigDecimal` class in Ruby to represent money related values in a more accurate manner

* Items that are exempt from basic sales tax(st) are specified as part of the `LineItem` class
  * Items are categorized as food, medical products and books based on certain keywords in the item names. Those categories that'll help check if an item is exempt from sales tax are also specified  as part of the `LineItem` class

* Imported items are those that have the word `imported` in them.

* With **Single Responsiblity Principle** in mind the responsibility of each class is:
  * A `CsvParser` class that is used to read the input from a CSV file and remove all unnecessary leading and trailing whitespaces
  * A `LineItem` class that is used to contain the different properties related to each line item.
  * A `TaxCalculator` class that calculates
    * The price of an item inclusive of tax
    * The total sales tax per item
  * A `ReceiptGenerator` class that is mainly used to generate a receipt
  * A `ShoppingCart` class that is used to facilitate the purchase/checkout process


### Assumptions
* The program accepts Comma Separated Values(CSV) as input. Hence I've made use of a `CsvParser` to read CSV data.
* The CSV files are to be placed in the `input` directory inorder to be read by the program
* Price is a positive number
* Product quantity is a positive integer.

## Usage

### Dependencies
* Ruby 2.6.3
* Please refer to the Gemfile for the other dependencies

### Setup
* Run `bundle install` from a project's root directory to install the related dependencies.

### Running the program
One can run the program with the below command from the projects root directory.

*Format:*

`ruby bin/generate_sales_receipt.rb path_to_csv_file_name_present_in_input_directory.csv`

*Example:*

`ruby bin/generate_sales_receipt.rb shopping_basket3.csv`

### Running the tests
* One can run the specs from the project's root directory with the command `rspec`

### Program Output

* Below is a sample program output run against the command `ruby bin/generate_sales_receipt.rb shopping_basket3.csv`

```
1, imported bottle of perfume, 32.19
1, bottle of perfume, 20.89
1, packet of headache pills, 9.75
1, imported box of chocolates, 11.85

Sales Taxes: 6.7
Total: 74.68
```
