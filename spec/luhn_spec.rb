require 'minitest/autorun'
require "mocha/setup"

require File.expand_path(File.dirname(__FILE__)) + '/../lib/luhn.rb'

describe Luhn do
  before do
    @luhn = Luhn.new('4111111111111111')
  end
  describe :get_numbers do
    it "should return an array of numbers" do
      @luhn.get_numbers.must_equal [4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    end
  end

  describe :double_every_other_digit do
    it "should get_numbers" do
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

end
