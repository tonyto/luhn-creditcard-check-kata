require 'minitest/autorun'
require "mocha/setup"

require File.expand_path(File.dirname(__FILE__)) + '/../lib/creditcard.rb'

describe "input and output of dataset" do
  describe "VISA: 4111111111111111" do
    it "should be valid" do
      CreditCard.validate('4111111111111111').must_equal "VISA: 4111111111111111 (valid)"
    end
  end

end
