class OrderPresenter

	def initialize
		@printorder=[]
	end

	def print_order(orderwhatever)
		puts "Customer Receipt \tTable ##{orderwhatever.table_number.to_s}"
		puts "qty\titem\t\tsub\tTotal"
		puts "-------------------------------------"
		orderwhatever.items.each do |item|
			puts item.get_receipt_line 
			puts item.position_number.to_s
		end
		puts "-------------------------------------"
		total, gst = orderwhatever.find_order_total_and_gst
		puts "SUB TOTAL\t\t\t$" + '%.2f'%total
		puts "GST\t\t\t\t$" + '%.2f'%gst
		puts "TOTAL\t\t\t\t$" + '%.2f' % (total+gst)
		puts "\n\n"
	end

	def kitchen_print_order(orderwhatever)
		puts "Kitchen Order \tTable ##{orderwhatever.table_number.to_s}"
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

	def reprint_last_kitchen_order
	end

	def bar_print_order(orderwhatever)
		puts "Drinks Order \tTable ##{orderwhatever.table_number.to_s}"
		puts "qty\titem\t"
		puts "----------------------------"
		orderwhatever.drinks.each do |item|
			puts item.get_docket_line
		end
		puts "----------------------------"
		puts "\n\n"
	end

	def reprint_last_bar_order
	end

	def maitred_print_order
	end


end
