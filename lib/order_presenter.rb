class OrderPresenter

	def initialize
		@printorder=[]
		@last_order=nil
	end

	def print_order(orderwhatever)
		@last_order = orderwhatever
	end

	def print_last_order
		print_order(@last_order)
	end

end
