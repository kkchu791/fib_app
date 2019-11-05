require 'rails_helper'

describe "fib_numbers", type: :request do
  describe "GET /current" do
    context "when given a position" do
      it "should return the correct fibonacci number" do
        get '/api/v1/current?position=2'
        json = JSON.parse(response.body)
        expect(json["number"]).to eq(1)
      end
    end

    context "when not given a position" do
      it "should return error" do
        get '/api/v1/current'
        json = JSON.parse(response.body)
        expect(json["status"]).to eq("bad_request")
      end
    end
  end

  describe "GET /next" do
    context "when given a position" do
      it "should return the next fibonacci number" do
        get '/api/v1/next?position=2'
        json = JSON.parse(response.body)
        expect(json["number"]).to eq(2)
      end
    end

    context "when not given a position" do
      it "should return error" do
        get '/api/v1/next'
        json = JSON.parse(response.body)
        expect(json["status"]).to eq("bad_request")
      end
    end
  end

  describe "GET /previous" do
    context "when given a position" do
      it "should return the previous fibonacci number" do
        get '/api/v1/previous?position=2'
        json = JSON.parse(response.body)
        expect(json["number"]).to eq(1)
      end
    end

    context "when not given a position" do
      it "should return error" do
        get '/api/v1/previous'
        json = JSON.parse(response.body)
        expect(json["status"]).to eq("bad_request")
      end
    end
  end
end
