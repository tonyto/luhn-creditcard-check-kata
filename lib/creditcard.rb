require File.expand_path(File.dirname(__FILE__)) + '/luhn.rb'

class CreditCard
  attr_accessor :number

  def self.validate number
    creditcard = CreditCard.new(number)
    type = creditcard.identify
    luhn_result = Luhn.valid?(number) ? "valid" : "invalid"

    "#{type}: #{number} (#{luhn_result})"
  end

  def initialize number
    @number = number
  end

  def identify
    return "AMEX" if number.start_with?('34')
    return "AMEX" if number.start_with?('37')
    return "DISCOVER" if number.start_with?('6011')
    return "MASTERCARD" if number.start_with?('51')
    return "MASTERCARD" if number.start_with?('55')
    return "VISA" if number.start_with?('4')
    nil
  end
end

