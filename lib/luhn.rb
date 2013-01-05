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

  def double_every_other_digit
    numbers = get_numbers()
    numbers.pop()
    reversed_numbers = numbers.reverse()
    reversed_numbers.each_with_index.map{|n, i| i.even? ? n*2 : n}
  end

  def sum_result
    double_every_other_digit.inject(&:+) + get_numbers.last
  end
end
