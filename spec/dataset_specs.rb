require 'minitest/autorun'
require "mocha/setup"

require File.expand_path(File.dirname(__FILE__)) + '/../lib/creditcard.rb'

describe "input and output of dataset" do
  describe "VISA: 4111111111111111" do
    it "should be valid" do
      CreditCard.validate('4111111111111111').must_equal "VISA: 4111111111111111 (valid)"
    end
  end

  describe "VISA: 4111111111111" do
    it "should be invalid" do
      CreditCard.validate('4111111111111').must_equal "VISA: 4111111111111 (invalid)"
    end
  end

  describe "VISA: 4012888888881881" do
    it "should be valid" do
      CreditCard.validate('4012888888881881').must_equal "VISA: 4012888888881881 (valid)"
    end
  end

  describe "AMEX: 378282246310005" do
    it "should be valid" do
      CreditCard.validate('378282246310005').must_equal "AMEX: 378282246310005 (valid)"
    end
  end

  describe "Discover: 6011111111111117" do
    it "should be valid" do
      CreditCard.validate('6011111111111117').must_equal "Discover: 6011111111111117 (valid)"
    end
  end

  describe "MasterCard: 5105105105105100" do
    it "should be valid" do
      CreditCard.validate('5105105105105100').must_equal "MasterCard: 5105105105105100 (valid)"
    end
  end

  describe "MasterCard: 5105105105105106" do
    it "should be invalid" do
      CreditCard.validate('5105105105105106').must_equal "MasterCard: 5105105105105106 (invalid)"
    end
  end

  describe "Unknown: 9111111111111111" do
    it "should be invalid" do
      CreditCard.validate('9111111111111111').must_equal "Unknown: 9111111111111111 (invalid)"
    end
  end

end
