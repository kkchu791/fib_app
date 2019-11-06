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
      it "should return failure response" do
        get '/api/v1/current'
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("param is missing or the value is empty: position")
      end
    end

    context "when given a large position" do
      it "should be able to return correct fibonacci number" do
        get "/api/v1/current?position=1000"
        json = JSON.parse(response.body)
        fib_number_at_1000_position = 43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875
        expect(json["number"]).to eq(fib_number_at_1000_position)
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
        expect(json["error"]).to eq("param is missing or the value is empty: position")
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
        expect(json["error"]).to eq("param is missing or the value is empty: position")
      end
    end
  end
end
