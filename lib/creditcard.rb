class CreditCard
  attr_accessor :number

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

  def validate
    Luhn.valid?(@number)
  end
end

class Luhn
  def self.valid? number
    true
  end
end
