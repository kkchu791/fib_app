require 'rails_helper'

describe "fibonacci_cacher", type: :service do

  describe "#get" do
    context "when given a position" do
      it "should return the correct fibonacci number" do
        expect(FibonacciCacher.get(2)).to eq(1)
      end
    end

    context "when NOT given a position" do
      it "should return an error" do
        expect{ FibonacciCacher.get("") }.to raise_error("You need to pass in a position.")
      end
    end
  end
end
