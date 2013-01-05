class Luhn
  def self.valid? number
    luhn = Luhn.new(number)
    luhn.sum_result()%10 == 0 ? true : false
  end

  attr_accessor :number

  def initialize number
    @number = number
  end

  def get_numbers number_string
    number_string.split(//).map{|n| n.to_i}
  end

  def double_every_other_digit
    numbers = get_numbers(@number)
    numbers.pop()
    reversed_numbers = numbers.reverse()
    reversed_numbers.each_with_index.map{|n, i| i.even? ? n*2 : n}
  end

  def sum_result
    number_string = double_every_other_digit.join(',').gsub(',','')
    
    get_numbers(number_string).inject(&:+) + get_numbers(@number).last
  end
end
