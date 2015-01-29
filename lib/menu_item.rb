class MenuItem

	attr_reader :item_name, :item_price, :item_course, :item_prints_location

	def initialize(item_name, item_price, item_prints_location, gst_rate, item_course)
		@item_name=item_name
		@item_price=item_price
		@item_prints_location=item_prints_location
		@gst_rate=gst_rate
		@item_course=item_course
	end

	def get_gst
		@item_price*@gst_rate
	end

end