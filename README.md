# CreditDebitCardNumberValidator
Our gem check any credit/debit card number by determining its brand using IIN Ranges and validate it using Luhn algorithm.

Try it now! from [here](http://cdcnv.herokuapp.com/).

### More about BIN numbers and IIN Ranges:
- http://en.wikipedia.org/wiki/Payment_card_number
- http://www.iinbase.com

### More about Luhn algorithm:
- https://en.wikipedia.org/wiki/Luhn_algorithm

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'credit_debit_card_number_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install credit_debit_card_number_validator

## Accepted Brands

- American Express
- Bankcard
- CARDGUARD
- China UnionPay
- Dancord
- Diners Club Carte Blanche
- Diners Club enRoute
- Diners Club International
- Discover Card
- Hipercard
- InstaPayment
- InterPayment
- JCB
- Laser
- Maestro
- Master Card
- RuPay
- Solo
- Switch
- UATP
- Verve
- Visa Electron
- Visa
- Voyager

## Usage

#### Example using `Validator` class

##### class method > all_information_about

```ruby
my_card = CreditDebitCardNumberValidator::Validator.all_information_about('348998173777802')

my_card.card_number   # 348998173777802
# my_card.card_number contain card number

my_card.is_valid      # true
# my_card.is_valid contain luhn algorithm result

my_card.mod_10_result # 0
# my_card.mod_10_result contain mod 10 result from luhn algorithm

my_card.iin           # 34
# my_card.iin contain IIN Range

my_card.brand         # American Express
# my_card.brand contain card brand

my_card.check_digit   # 2
# my_card.check_digit contain the next check digit of card number

my_card.length        # 15
# my_card.length contain card number length
```

Gathering every information about card number and return them in object of type `Information` class.

Return type: `Information` class object.

----------

##### class method > validate

```ruby
my_validation = CreditDebitCardNumberValidator::Validator.validate('6264185212922132067')

my_validation[0] # true
# my_validation[0] contain luhn algorithm result

my_validation[1] # 0
# my_validation[1] contain mod 10 result from luhn algorithm
```

Validate card number using Luhn algorithm and return array contain true if the number pass the test or false otherwise with mod 10 result.

Return type: `Array`.

----------

##### class method > luhn_test

```ruby
my_luhn_test_result = CreditDebitCardNumberValidator::Validator.luhn_test('5019717010103742')

my_luhn_test_result # true
# my_luhn_test_result contain luhn algorithm result
```

Validate card number using luhn algorithm and return true if the number pass the test or false otherwise.

Return type: `Boolean`.

----------

##### class method > mod_10_result

```ruby
my_mod_10_result = CreditDebitCardNumberValidator::Validator.mod_10_result('30350713037359')

my_mod_10_result # 0
# my_mod_10_result contain mod 10 result from luhn algorithm
```

Validate card number using luhn algorithm and return mod 10 result.

Return type: `Integer`.

----------

##### class method > determine_iin_and_brand

```ruby
my_determine = CreditDebitCardNumberValidator::Validator.determine_iin_and_brand('6011622563605042')

my_determine[0] # 6011
# my_determine[0] contain IIN Range

my_determine[1] # Discover Card
# my_determine[1] contain card brand
```

Determine card brand using IIN Ranges and return array contain the IIN of the card number and the brand name.

Return type: `Array`.

----------

##### class method > determine_iin

```ruby
my_determine = CreditDebitCardNumberValidator::Validator.determine_iin('3841005899088180330')

my_determine # 384
# my_determine contain IIN Range
```

Determine card IIN Ranges and return it.

Return type: `Integer`.

----------

##### class method > determine_brand

```ruby
my_determine = CreditDebitCardNumberValidator::Validator.determine_brand('6380654534552139')

my_determine # InstaPayment
# my_determine contain card brand
```

Determine card brand using IIN Ranges and return it.

Return type: `String`.

----------

##### class method > next_check_digit

```ruby
my_next_check_digit = CreditDebitCardNumberValidator::Validator.next_check_digit('3337910604152361')

my_next_check_digit # 3
# my_next_check_digit contain the next check digit of card number
```

Calculate the next check digit of card number and return it.

Return type: `String`.

----------

##### class method > next_check_digits

```ruby
my_next_check_digits = CreditDebitCardNumberValidator::Validator.next_check_digits('6304445859171404', 5)

my_next_check_digits # 91834
# my_next_check_digits contain the next check digits of card number
```

Calculate the next check digits of card number and return them.

Return type: `String`.

----------

##### class method > number_length

```ruby
my_card_number_length = CreditDebitCardNumberValidator::Validator.number_length('6799990100000000019')

my_card_number_length # 19
# my_card_number_length contain card number length
```

Calculate and return card number length.

Return type: `Integer`.

----------

#### Example using `Information` class

You don't need to use `Information` class! only use the object returned from `all_information_about` class method from `Validator` class.

## License

Released under the MIT License

Copyright (c) 2016 [AliOsm](http://fb.com/Ali.L.Malak)
