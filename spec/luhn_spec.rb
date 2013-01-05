require 'minitest/autorun'
require "mocha/setup"

require File.expand_path(File.dirname(__FILE__)) + '/../lib/luhn.rb'

describe Luhn do
  before do
    @luhn = Luhn.new('4111111111111111')
  end
  subject do
  end
  describe :get_numbers do
    it "should return an array of numbers" do
      @luhn.get_numbers.must_equal [4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    end
  end

end
