module CreditDebitCardNumberValidator

	# Information class
	# store all card number information top return it later
	class Information

		# make all class variables accessible
		attr_accessor :card_number, :is_valid, :mod_10_result, :iin, :brand, :check_digit, :length

		# initializer to initialize all class variables
		def initialize
			@card_number = 0   # store card number
			@is_valid = false  # store luhn algorithm result
			@mod_10_result = 0 # store mod 10 result from luhn algorithm
			@iin = 0           # store card number IIN Range
			@brand = ''        # store card brand
			@check_digit = ''  # store the next check digit of card number
			@length = 0        # store card number length
		end
	end
end
