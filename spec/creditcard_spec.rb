require 'minitest/autorun'
require "mocha/setup"

require File.expand_path(File.dirname(__FILE__)) + '/../lib/creditcard.rb'

describe CreditCard do
  subject do
    CreditCard
  end

  describe :identify do
    describe "an AMEX card type" do
      it "should start with 34" do
        card = subject.new('341111111111111')
        card.identify.must_equal "AMEX"
      end
      it "should start with 37" do
        card = subject.new('371111111111111')
        card.identify.must_equal "AMEX"
      end
    end
    describe "a DISCOVER card type" do
      it "should start with 6011" do
        card = subject.new('601111111111111')
        card.identify.must_equal "DISCOVER"
      end
    end
    describe "a MASTERCARD card type" do
      it "should start with 51" do
        card = subject.new('511111111111111')
        card.identify.must_equal "MASTERCARD"
      end
      it "should start with 55" do
        card = subject.new('551111111111111')
        card.identify.must_equal "MASTERCARD"
      end
    end
    describe "a VISA card type" do
      it "should start with 4" do
        card = subject.new('411111111111111')
        card.identify.must_equal "VISA"
      end
    end
  end

  describe :validate do
    it "should perform the luhn checksum on the number" do
      number = '411111111111111'
      Luhn.expects(:valid?).with(number).returns(true)

      subject.validate number
    end
  end
end
