require 'minitest/autorun'
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
    end
  end
end
