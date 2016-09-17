# CreditDebitCardNumberValidator module
# main module contain gem classes
# use this module to deal with gem classes,
# create objects and work with class methods
# to validate your data
module CreditDebitCardNumberValidator

  # Validator class
  # validate and gathering information about card number
  # 11 methods
  class Validator

  	# class method > check
  	# check card_number variable is contain digits on it or not
    # if there is not digits the method raise ArgumentError
    # with message 'no card number specified'
  	def self.check card_number
  		raise ArgumentError, "no card number specified" if card_number.to_i == 0
  	end

  	# class method > all_information_about
  	# get every information about card number and
    # return them in object of type Information class
  	# return example: #<CreditDebitCardNumberValidator::Information:0x2eb4b90 @card_number="4929334156772439", @is_valid=true, @mod_10_result=0, @iin=4, @brand="Visa", @check_digit="9", @length=16>
  	def self.all_information_about card_number

  		# check card_number variable
  		check card_number

  		# create new object of type Information class
      # to store information in it
  		info = Information.new
  	
  		# validate and gathering information and store them in info object
  		info.card_number = card_number.to_i
  		info.is_valid, info.mod_10_result = validate card_number
  		info.iin, info.brand = determine_iin_and_brand card_number
  		info.check_digit = next_check_digit card_number
  		info.length = number_length card_number

  		# return info object that contain information about the card number
      info
    end

    # class method > validate
    # validate card number using luhn algorithm and return array contain
    # true if the number pass the test or false otherwise with mod 10 result
    # return example: [true, 0]
    # return example: {'luhn test' => (true), 'mod 10 result' => 0}
    def self.validate card_number

    	# check card_number variable
    	check card_number

    	# initialize variable to do the luhn test
    	total = 0

    	# apply the test
    	if card_number.size.even?
    		# if card number length is even
    		card_number.split('').each_with_index { |e, i| i.even? ? total += ((e.to_i * 2) > 9 ? (e.to_i * 2) - 9 : (e.to_i * 2)) : total += e.to_i }
    	else
    		# if card number length is odd
    		card_number.split('').each_with_index { |e, i| i.odd? ? total += ((e.to_i * 2) > 9 ? (e.to_i * 2) - 9 : (e.to_i * 2)) : total += e.to_i }
    	end

    	# return the result
    	[total % 10 == 0, total % 10]
    end

    # class method > luhn_test
    # validate card number using luhn algorithm and return
    # true if the number pass the test or false otherwise
    # return example: true
    def self.luhn_test card_number

      # check card_number variable
      check card_number

      (validate card_number)[0]
    end

    # class method > mod_10_result
    # validate card number using luhn algorithm and return mod 10 result
    # return example: 0
    def self.mod_10_result card_number

      # check card_number variable
      check card_number

      (validate card_number)[1]
    end

    # class method > determine_iin_and_brand
    # determine card brand using IIN Ranges and return array contain
    # the IIN of the card number and the brand name
    # return example: [37, 'American Express']
    # return example: {'IIN' => 37, 'Brand Name' => 'American Express'}
    def self.determine_iin_and_brand card_number

    	# check card_number variable
    	check card_number

    	# calculate card number length
    	length = card_number.size

    	# preparation IIN Ranges from card number
    	iin1 = card_number[0]
    	iin2 = card_number[0..1]
    	iin3 = card_number[0..2]
    	iin4 = card_number[0..3]
    	iin6 = card_number[0..5]

    	# test all IIN Ranges of supported brands
    	if (['34', '37'].include? (iin2)) && length == 15
    		[iin2.to_i, 'American Express']
    		# {'IIN' => iin2.to_i, 'Company Name' => 'American Express'}
    	elsif iin4 == '5610' && length == 16
    		[iin4.to_i, 'Bankcard']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Bankcard'}
    	elsif (('560221'..'560225').include? (iin6)) && length == 16
    		[iin6.to_i, 'Bankcard']
    		# {'IIN' => iin6.to_i, 'Company Name' => 'Bankcard'}
    	elsif iin4 == '5392' && length == 16
    		[iin4.to_i, 'CARDGUARD EAD BG ILS']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'CARDGUARD EAD BG ILS'}
      elsif (['622', '624', '625', '626', '628'].include? (iin3)) && (length >= 16 && length <= 19)
        [iin3.to_i, 'China UnionPay']
        # {'IIN' => iin3.to_i, 'Company Name' => 'China UnionPay'}
      elsif iin4 == '5019' && length == 16
        [iin4.to_i, 'Dankort']
        # {'IIN' => iin4.to_i, 'Company Name' => 'Dankort'}
    	elsif (('301'..'305').include? (iin3)) && length == 14
    		[iin3.to_i, 'Diners Club Carte Blanche']
    		# {'IIN' => iin3.to_i, 'Company Name' => 'Diners Club Carte Blanche'}
    	elsif (['2014', '2149'].include? (iin4)) && length == 15
    		[iin4.to_i, 'Diners Club Carte enRoute']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Diners Club Carte enRoute'}
    	elsif (['36', '38', '39'].include? (iin2)) && length == 14
    		[iin2.to_i, 'Diners Club International']
    		# {'IIN' => iin2.to_i, 'Company Name' => 'Diners Club International'}
    	elsif iin3 == '309' && length == 14
    		[iin3.to_i, 'Diners Club International']
    		# {'IIN' => iin3.to_i, 'Company Name' => 'Diners Club International'}
    	elsif iin2 == '65' && length == 16
    		[iin2.to_i, 'Discover Card']
    		# {'IIN' => iin2.to_i, 'Company Name' => 'Discover Card'}
    	elsif (('644'..'649').include? (iin3)) && length == 16
    		[iin3.to_i, 'Discover Card']
    		# {'IIN' => iin3.to_i, 'Company Name' => 'Discover Card'}
    	elsif iin4 == '6011' && length == 16
    		[iin4.to_i, 'Discover Card']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Discover Card'}
    	elsif (('622126'..'622925').include? (iin6)) && length == 16
    		[iin6.to_i, 'Discover Card']
    		# {'IIN' => iin6.to_i, 'Company Name' => 'Discover Card'}
      elsif iin3 == '384' && length == 19
        [iin3.to_i, 'Hipercard']
        # {'IIN' => iin3.to_i, 'Company Name' => 'Hipercard'}
    	elsif (('637'..'639').include? (iin3)) && length == 16
    		[iin3.to_i, 'InstaPayment']
    		# {'IIN' => iin3.to_i, 'Company Name' => 'InstaPayment'}
    	elsif iin3 == '636' && (length >= 16 && length <= 19)
    		[iin3.to_i, 'InterPayment']
    		# {'IIN' => iin3.to_i, 'Company Name' => 'InterPayment'}
      elsif (('353'..'358').include? (iin3)) && (length == 15 || length == 16)
        [iin3.to_i, 'JCB']
        # {'IIN' => iin3.to_i, 'Company Name' => 'JCB'}
    	elsif ((('3528'..'3589').include? (iin4)) || (['3088', '3096', '3112', '3158', '3337'].include? (iin4))) && (length == 15 || length == 16)
    		[iin4.to_i, 'JCB']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'JCB'}
      elsif (['1800', '2131'].include? (iin4)) && length == 15
        [iin4.to_i, 'JCB']
        # {'IIN' => iin4.to_i, 'Company Name' => 'JCB'}
      elsif iin6 == '357266' && length == 19
        [iin6.to_i, 'JCB']
        # {'IIN' => iin6.to_i, 'Company Name' => 'JCB'}
    	elsif (['6304', '6706', '6771', '6709'].include? (iin4)) && (length >= 16 && length <= 19)
    		[iin4.to_i, 'Laser']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Laser'}
      elsif (('56'..'59').include? (iin2)) && (length >= 12 && length <= 19)
        [iin2.to_i, 'Maestro']
        # {'IIN' => iin2.to_i, 'Company Name' => 'Maestro'}
      elsif ((('502'..'509').include? (iin3)) || (('602'..'605').include? (iin3)) || (('671'..'675').include? (iin3)) || (['500', '621', '627', '629', '677', '679'].include? (iin3))) && (length >= 12 && length <= 19)
        [iin3.to_i, 'Maestro']
        # {'IIN' => iin3.to_i, 'Company Name' => 'Maestro'}
    	elsif ((('5010'..'5018').include? (iin4)) || (('6012'..'6019').include? (iin4)) || (('6760'..'6766').include? (iin4)) || (('6768'..'6771').include? (iin4)) || (['6060', '6304', '6390', '6010'].include? (iin4))) && (length >= 12 && length <= 19)
    		[iin4.to_i, 'Maestro']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Maestro'}
    	elsif ((('51'..'55').include? (iin2)) || (('23'..'26').include? (iin2))) && length == 16
    		[iin2.to_i, 'Master Card']
    		# {'IIN' => iin2.to_i, 'Company Name' => 'Master Card'}
      elsif ((('223'..'229').include? (iin3)) || iin3 == '271') && length == 16
        [iin3.to_i, 'Master Card']
        # {'IIN' => iin3.to_i, 'Company Name' => 'Master Card'}
      elsif ((('2221'..'2229').include? (iin4)) || iin4 == '2720') && length == 16
        [iin4.to_i, 'Master Card']
        # {'IIN' => iin4.to_i, 'Company Name' => 'Master Card'}
      elsif (['607', '608'].include? (iin3)) && length == 16
        [iin3.to_i, 'RuPay']
        # {'IIN' => iin3.to_i, 'Company Name' => 'RuPay'}
      elsif (('6061'..'6069').include? (iin4)) && length == 16
        [iin4.to_i, 'RuPay']
        # {'IIN' => iin4.to_i, 'Company Name' => 'RuPay'}
    	elsif (['6334', '6767'].include? (iin4)) && (length == 16 || length == 18 || length == 19)
    		[iin4.to_i, 'Solo']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Solo'}
    	elsif (['4903', '4905', '4911', '4936', '6333', '6759'].include? (iin4)) && (length == 16 || length == 18 || length == 19)
    		[iin4.to_i, 'Switch']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Switch'}
    	elsif (['633312', '633110', '633304', '633303', '633301', '633300'].include? (iin6)) && (length == 16 || length == 18 || length == 19)
    		[iin6.to_i, 'Switch']
    		# {'IIN' => iin6.to_i, 'Company Name' => 'Switch'}
    	elsif iin1 == '1' && length == 15
    		[iin1.to_i, 'UATP']
    		# {'IIN' => iin1.to_i, 'Company Name' => 'UATP'}
    	elsif (('506099'..'506198').include? (iin6)) || (('650002'..'650027').include? (iin6)) && (length == 16 || length == 19)
    		[iin6.to_i, 'Verve']
    		# {'IIN' => iin6.to_i, 'Company Name' => 'Verve'}
    	elsif (['4026', '4508', '4844', '4913', '4917'].include? (iin4))  && (length == 13 || length == 16)
    		[iin4.to_i, 'Visa Electron']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Visa Electron'}
    	elsif iin6 == '417500' && (length == 13 || length == 16)
    		[iin6.to_i, 'Visa Electron']
    		# {'IIN' => iin6.to_i, 'Company Name' => 'Visa Electron'}
    	elsif iin1 == '4' && (length == 13 || length == 16)
    		[iin1.to_i, 'Visa']
    		# {'IIN' => iin1.to_i, 'Company Name' => 'Visa'}
    	elsif iin4 == '8699' && length == 15
    		[iin4.to_i, 'Voyager']
    		# {'IIN' => iin4.to_i, 'Company Name' => 'Voyager'}
    	else
    		# return 0 as IIN Range and Unknown as brand name if card number is not determined
    		[0, 'Unknown']
    		# {'IIN' => 0, 'Brand Name' => 'Unknown'}
    	end
    end

    # class method > determine_iin
    # determine card IIN Ranges and return it
    # return example: 37
    def self.determine_iin card_number

      # check card_number variable
      check card_number

      (determine_iin_and_brand card_number)[0]
    end

    # class method > determine_brand
    # determine card brand using IIN Ranges and return it
    # return example: 'Visa'
    def self.determine_brand card_number

      # check card_number variable
      check card_number

      (determine_iin_and_brand card_number)[1]
    end

    # class method > next_check_digit
    # calculate the next check digit of card number and return it
    # return example: '3'
    def self.next_check_digit card_number

    	# check card_number variable
    	check card_number

    	# calculate mod 10 result by applying luhn algorithm
    	tmp = (validate (card_number + '0'))[1]

    	# if mod 10 result equal to 0 return 0 else subtract the result from 10 and return
    	tmp == 0 ? '0' : (10 - tmp).to_s
    end

    # class method > next_check_digits
    # calculate the next check digits of card number and return them
    # return example: '91834'
    def self.next_check_digits card_number, number

      # check card_number variable
      check card_number

      # initialize variable to return it
      tmp = ''

      # add next check digits
      number.times { tmp += (card_number += next_check_digit card_number)[-1] }

      # return next check digits
      tmp
    end

    # class method > number_length
    # calculate and return card number length
    # return example: 16
    def self.number_length card_number

    	# check card_number variable
    	check card_number

      # return card number length
    	card_number.size
    end
  end
end
