Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt that lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets. The output should be to standard out or CSV.

Proper architecture design is important. Each row in the input represents a line item of the receipt.

sales tax - 10% - all goods, except books, food & medical products
Import duty —— 5% - imported goods 
sales tax

1. How do you identity imported goods?
2. How do you identify what type of product it is?
3. first calculate 10% of goods price
4. calculate imported sales tax 
5. print receipt pass array of values as argument -> output should be csv
6. each row represents line item 
7. Receipt contains all items, their prices(including taxes)
8. finishing with total cost of the items and total amount of taxes paid