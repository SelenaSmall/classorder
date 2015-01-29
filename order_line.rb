class OrderLine

	attr_reader :menu_item, :position_number

	def initialize(quantity, menu_item, postion_number)
		@quantity=quantity
		@menu_item=menu_item
		@position_number=position_number 
	end

	def get_receipt_line
		@quantity.to_s +
			"\t" + @menu_item.item_name +
			"\t\t$" + '%.2f'% @menu_item.item_price +
			"\t$" + '%.2f'%get_total_quantity_of_items
	end

	def get_docket_line
		@quantity.to_s + "\t" + @menu_item.item_name
	end

	def get_total_quantity_of_items
		@quantity*@menu_item.item_price
	end

	def get_total_gst
		@quantity*@menu_item.get_gst
	end

end

