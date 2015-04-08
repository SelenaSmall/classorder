require './order_presenter'

class BarPresenter < OrderPresenter 

	def print_order(orderwhatever)
		super orderwhatever
		puts "Drinks Order \t ##{orderwhatever.table.name}"
		puts "qty\titem\t"
		puts "----------------------------"
		orderwhatever.drinks.each do |item|
			puts item.get_docket_line
		end
		puts "----------------------------"
		puts "\n\n"
	end

end
