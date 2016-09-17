# Suppoerted Companies:
# amex   | American Express          | 15             | Luhn | 34, 37

# bc4    | Bankcard                  | 16             | Luhn | 5610
# bc6    | Bankcard                  | 16             | Luhn | 560221 - 560225

# cebi   | CARDGUARD EAD BG ILS      | 16             | Luhn | 5392

# cup    | China UnionPay            | 16, 17, 18, 19 | Unk  | 622, 624 - 626, 628

# dn     | Dancord                   | 16             | Luhn | 5019

# dccb   | Diners Club Carte Blanche | 14             | Luhn | 300 - 305
# dcer   | Diners Club enRoute       | 15             | No V | 2014, 2149
# dcint2 | Diners Club International | 14             | Luhn | 36, 38, 39
# dcint3 | Diners Club International | 14             | Luhn | 309

# disc2  | Discover Card             | 16             | Luhn | 65
# disc3  | Discover Card             | 16             | Luhn | 644 - 649
# disc4  | Discover Card             | 16             | Luhn | 6011
# disc6  | Discover Card             | 16             | Luhn | 622126 - 622925

# hc     | Hipercard                 | 19             | Luhn | 348

# ipi    | InstaPayment              | 16             | Luhn | 637 - 639

# ipr    | InterPayment              | 16, 17, 18, 19 | Luhn | 636

# jcb3   | JCB                       | 15, 16         | Luhn | 353 - 358
# jcb4   | JCB                       | 15, 16         | Luhn | 3528, 3589, 3088, 3112, 3337, 3158, 3096, 1000, 2131
# jcb6   | JCB                       | 15, 16         | Luhn | 357266

# laser  | Laser                     | 16, 17, 18, 19 | Luhn | 6304, 6706, 6771, 6709

# maes2  | Maestro                   | 12 ........ 19 | Luhn | 56 - 59
# maes3  | Maestro                   | 12 ........ 19 | Luhn | 502 - 509, 602 - 605, 671 - 675, 500, 621, 627, 629, 677, 679
# maes4  | Maestro                   | 12 ........ 19 | Luhn | 5010 - 5018, 6010, 6012 - 6019, 6760 - 6766, 6768 - 6771, 6060, 6304, 6390

# mc2    | Master Card               | 16             | Luhn | 51 - 55, 23 - 26
# mc3    | Master Card               | 16             | Luhn | 223 - 229, 271
# mc4    | Master Card               | 16             | Luhn | 2221 - 2229, 2720

# rupay3 | RuPay                     | 16             | Unk  | 607, 608
# rupay4 | RuPay                     | 16             | Unk  | 6061 - 6069

# solo   | Solo                      | 16, 18, 19     | Luhn | 6334, 6767

# swch4  | Switch                    | 16, 18, 19     | Luhn | 4903, 4905, 4911, 4936, 6333, 6759
# swch6  | Switch                    | 16, 18, 19     | Luhn | 633312, 633110, 633304, 633303, 633301, 633300

# uatp   | UATP                      | 15             | Luhn | 1

# verve  | Verve                     | 16, 19         | Luhn | 506099 - 506198, 650002 - 650027

# visae4 | Visa Electron             | 13, 16         | Luhn | 4026, 4508, 4844, 4913, 4917
# visae6 | Visa Electron             | 13, 16         | Luhn | 417500

# visa   | Visa                      | 13, 16         | Luhn | 4

# voy    | Voyager                   | 15             | Luhn | 8699

# Supported companies with other brands:
# dcuc   | Diners Club US and Canada | 16             | Luhn | 54, 55 | Master Card

# Resources:
# http://blog.groundlabs.com/cardholder-data-discovery-anatomy-of-a-credit-card-bin-ranges-luhn-checks
# http://en.wikipedia.org/wiki/Payment_card_number
# http://www.iinbase.com
# http://www.getcreditcardnumbers.com
# http://planetcalc.com/2464/

# require classes files
require 'validator'
require 'information'

# CreditDebitCardNumberValidator module
# main module contain gem classes
# use this module to deal with gem classes,
# create objects and work with class methods
# to validate your data
module CreditDebitCardNumberValidator

	# Validator class
  # validate and gathering information about card number
  # 11 methods
	# it is included using require 'validator'
	class Validator
	end

	# Information class
	# store all card number information
	# it is included using require 'information'
	class Information
	end
end
