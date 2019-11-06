require 'rails_helper'

describe FibonacciCacher, type: :service do
  describe "#get" do
    it "should return correct fibonacci number at given position" do
      expect(FibonacciCacher.get(3)).to eq(2)
    end

    it "should write our position to a cache" do
      FibonacciCacher.get(3)
      expect(Rails.cache.fetch("fib_cache")[3]).to eq(2)
    end

    context "when given a position" do
      it "should return the correct fibonacci number" do
        expect(FibonacciCacher.get(2)).to eq(1)
      end
    end

    context "when given a negative position" do
      it "should return an error" do
        expect{ FibonacciCacher.get(-1) }.to raise_error("must be a non negative integer")
      end
    end

    context "when given a non integer position" do
      it "should return an error" do
        expect{ FibonacciCacher.get("test") }.to raise_error("must pass an integer value")
      end
    end
  end
end
