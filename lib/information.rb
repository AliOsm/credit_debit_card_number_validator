# CreditDebitCardNumberValidator module
# main module contain gem classes
# use this module to deal with gem classes,
# create objects and work with class methods
# to validate your data
module CreditDebitCardNumberValidator

	# Information class
	# store all card number information to return it later
	class Information

		# make all class variables accessible
		attr_accessor :card_number, :is_valid, :mod_10_result, :iin, :brand, :check_digit, :length

		# initializer to initialize all class variables
		# class variables:
		# @card_number   -> store card number
		# @is_valid      -> store luhn algorithm result
		# @mod_10_result -> store mod 10 result from luhn algorithm
		# @iin           -> store card number IIN Range
		# @brand         -> store card brand
		# @check_digit   -> store the next check digit of card number
		# @length        -> store card number length
		def initialize
			@card_number = 0
			@is_valid = false
			@mod_10_result = 0
			@iin = 0
			@brand = ''
			@check_digit = ''
			@length = 0
		end
	end
end
