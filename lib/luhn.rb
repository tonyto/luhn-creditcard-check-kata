class Luhn
  def self.valid? number
    true
  end

  attr_accessor :number

  def initialize number
    @number = number
  end

  def get_numbers
    @number.split(//).map{|n| n.to_i}
  end
end
