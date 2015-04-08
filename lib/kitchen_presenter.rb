require './order_presenter'

class KitchenPresenter < OrderPresenter 

	def print_order(orderwhatever)
		super orderwhatever
		puts "Kitchen Order \t ##{orderwhatever.table.name}"
		puts "qty\titem\t"
		puts "----------------------------"
		starters = orderwhatever.starters
		if starters.length > 0
			puts "Starters" #this should be "if something in the order contains starters then puts this"
			starters.each do |item|
				puts item.get_docket_line
			end
			puts "----------------------------"
			puts "\n"
		end
		puts "Mains"
		orderwhatever.mains.each do |item|
			puts item.get_docket_line
		end
		puts "----------------------------"
		puts "\n"
		puts "Sides"
		orderwhatever.sides.each do |item|
			puts item.get_docket_line
		end
		puts "----------------------------"
		puts "\n"
		puts "Desserts"
		orderwhatever.desserts.each do |item|
			puts item.get_docket_line
		end
		puts "----------------------------"
		puts "\n\n"
	end

end