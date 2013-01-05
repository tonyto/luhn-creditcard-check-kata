class CreditCard
  attr_accessor :number

  def initialize number
    @number = number
  end

  def identify
    return "AMEX" if number.start_with?('34')
    return "DISCOVER" if number.start_with?('6011')
    nil
  end

end
