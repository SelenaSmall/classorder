class Order

	attr_reader :items, :table

	def initialize(table)
		@items = []
		@table = table
	end

	def add_item(order_item)
		@items.push(order_item)
	end

	def find_order_total_and_gst
		total = 0
		gst = 0
		@items.each do |item|
			total += item.get_total_quantity_of_items
			gst += item.get_total_gst
		end
		[ total, gst ]
	end

	def drinks
		drinks = []
		@items.each do |item|
			if item.menu_item.item_course == :spirits
				drinks.push(item)
			end
		end
		drinks
	end

	def starters
		starters = []
		@items.each do |item|
			if item.menu_item.item_course == :starter
				starters.push(item)
			end
		end
		starters
	end

	def mains
		mains = []
		@items.each do |item|
			if item.menu_item.item_course == :main
				mains.push(item)
			end
		end
		mains
	end

	def sides
		sides = []
		@items.each do |item|
			if item.menu_item.item_course == :side
				sides.push(item)
			end
		end
		sides
	end

	def desserts
		desserts = []
		@items.each do |item|
			if item.menu_item.item_course == :dessert
				desserts.push(item)
			end
		end
		desserts
	end

end
