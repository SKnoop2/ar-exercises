require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
# Exercise 4: Loading a subset of stores
# Borrowing and modifying the code from Exercise one, create 3 more stores:
# Surrey (annual_revenue of 224000, carries women's apparel only)
# Whistler (annual_revenue of 1900000 carries men's apparel only)
# Yaletown (annual_revenue of 430000 carries men's and women's apparel)
# Using the where class method from Active Record, fetch (a collection of) only those stores that carry men's apparel. Assign the results to a variable @mens_stores.
# Loop through each of these stores and output their name and annual revenue on each line.
# Do another fetch but this time load stores that carry women's apparel and are generating less than $1M in annual revenue.

store = Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
store = Store.create(name: "Whistler", annual_revenue: 430000, mens_apparel: true, womens_apparel: false)
store = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

# puts @mens_stores = Store.where(mens_apparel: true).pluck(:name, :annual_revenue)
@mens_stores = Store.where(mens_apparel: true)
puts "*** Mens Stores ***"
@mens_stores.map {
  |store| 
  puts "#{store.name}: #{store.annual_revenue}"
}
puts ""
@womens_stores = Store.where(womens_apparel: true)
puts "*** Womens Stores ***"
@womens_stores.map {
  |store| 
  if store.annual_revenue < 1000000
    puts "#{store.name}: #{store.annual_revenue}"
  end
}
