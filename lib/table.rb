class Table

#TODO x number of positions per table
#TODO x number of turnovers per day
#TODO list_of_orders_per_turnover
#TODO current order status (might be nil)
#TODO 
	attr_accessor :current_order, :name

	def initialize(number_of_positions, name)
		@number_of_pos=number_of_positions
		@current_order=nil
		@name=name
	end

	def print_number_of_positions
		puts @number_of_pos 
	end

end
