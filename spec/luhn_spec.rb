require 'minitest/autorun'
require "mocha/setup"

require File.expand_path(File.dirname(__FILE__)) + '/../lib/luhn.rb'

describe Luhn do
  before do
    @luhn = Luhn.new('4111111111111111')
  end
  describe :get_numbers do
    it "should return an array of numbers" do
      number = '4111111111111111'
      @luhn.get_numbers(number).must_equal [4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    end
  end

  describe :double_every_other_digit do
    it "should get_numbers" do
      number = '4111111111111111'
      @luhn.expects(:get_numbers).returns([4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
      @luhn.double_every_other_digit
    end
    it "should remove the last digit from the array" do
      numbers = [4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
      @luhn.stubs(:get_numbers).returns(numbers)

      numbers.expects(:pop)
      @luhn.double_every_other_digit
    end
    it "should double each even positioned number from a reversed order" do
      numbers = [4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
      @luhn.stubs(:get_numbers).returns(numbers)

      numbers.stubs(:pop)

      numbers.expects(:reverse).returns([1,1,1,1,1,1,1,1,1,1,1,1,1,1,4])

      result = [2,1,2,1,2,1,2,1,2,1,2,1,2,1,8]
      @luhn.double_every_other_digit.must_equal(result)
    end
  end

  describe :sum_result do
    it "should sum the result of the numbers, including the removed digit" do
      doubled_digits = [2,1,2,1,2,1,2,1,2,1,2,1,2,1,8]
      @luhn.stubs(:double_every_other_digit).returns(doubled_digits)
      @luhn.sum_result.must_equal 30
    end
    it "should split out numbers that are more than 1 digit" do
      luhn = Luhn.new('4111111111678941')
      luhn.sum_result.must_equal 56
    end
  end

  describe :valid? do
    describe :true do
      it "should equal 0 when mod by 10" do
        number = '4111111111111111'
        Luhn.valid?(number).must_equal true
      end
    end
    describe :false do
      it "should equal 6 when mod by 10" do
        number = '4111111111111141'
        Luhn.valid?(number).must_equal false
      end
    end
  end
end
