#!/usr/bin/ruby

require './order'
require './order_line'
require './menu_item'
require './order_presenter'

bourbon = MenuItem.new("bourbon", 8, :bar, 0.175, :spirits)
chicken_starter = MenuItem.new("Chicken Starter", 12, :kitchen, 0.15, :starter)
vodka = MenuItem.new("Vodka", 8, :bar, 0.175, :spirits)
pasta_main = MenuItem.new("Pasta Main", 25, :kitchen, 0.15, :main)
chocolate_dessert = MenuItem.new("Chocolate Dessert", 12, :kitchen, 0.15, :dessert)
side_of_bread = MenuItem.new("Side of Bread", 6, :kitchen, 0.15, :side)

table16 = Order.new(16)
table16.add_item OrderLine.new(4, bourbon, [1, 2])
table16.add_item OrderLine.new(2, chicken_starter, 3)
table16.add_item OrderLine.new(2, vodka, 2)
table16.add_item OrderLine.new(2, pasta_main, 1)
table16.add_item OrderLine.new(4, chocolate_dessert, 2)
table16.add_item OrderLine.new(1, side_of_bread, 5)

receipt_presenter = OrderPresenter.new
docket_presenter = OrderPresenter.new
	
##puts table16.inspect
docket_presenter.print_order(table16)
docket_presenter.bar_print_order(table16)
docket_presenter.kitchen_print_order(table16)

