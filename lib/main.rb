#!/usr/bin/ruby

require './order'
require './order_line'
require './menu_item'
require './kitchen_presenter'
require './bar_presenter'
require './receipt_presenter'
require './table'

bourbon = MenuItem.new("bourbon", 8, :bar, 0.175, :spirits)
chicken_starter = MenuItem.new("Chicken Starter", 12, :kitchen, 0.15, :starter)
vodka = MenuItem.new("Vodka", 8, :bar, 0.175, :spirits)
pasta_main = MenuItem.new("Pasta Main", 25, :kitchen, 0.15, :main)
chocolate_dessert = MenuItem.new("Chocolate Dessert", 12, :kitchen, 0.15, :dessert)
side_of_bread = MenuItem.new("Side of Bread", 6, :kitchen, 0.15, :side)

table16 = Table.new(4, "Table 16")

table16.current_order = Order.new(table16)
table16.current_order.add_item OrderLine.new(4, bourbon, [1, 2])
table16.current_order.add_item OrderLine.new(2, chicken_starter, 3)
table16.current_order.add_item OrderLine.new(2, vodka, 2)
table16.current_order.add_item OrderLine.new(2, pasta_main, 1)
table16.current_order.add_item OrderLine.new(4, chocolate_dessert, 2)
table16.current_order.add_item OrderLine.new(1, side_of_bread, 5)

receipt_presenter = ReceiptPresenter.new
kitchen_presenter = KitchenPresenter.new
bar_presenter = BarPresenter.new
	
##puts table16.inspect
# receipt_presenter.print_order(table16)
kitchen_presenter.print_order(table16.current_order)
# bar_presenter.print_order(table16)


#kitchen_presenter.print_last_order

