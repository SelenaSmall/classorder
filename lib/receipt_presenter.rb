require './order_presenter'

class ReceiptPresenter < OrderPresenter 

	def print_order(orderwhatever)
		super orderwhatever
		puts "Customer Receipt \t ##{orderwhatever.table.name}"
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

end