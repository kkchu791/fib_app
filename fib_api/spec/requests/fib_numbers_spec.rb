require 'rails_helper'
require 'swagger_helper'

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
        expect { get '/api/v1/current' }.to raise_error{ ActionController::ParameterMissing }
      end
    end

    context "when given a position and called 1000 times" do
      it "should be able to return correct fibonacci number" do
        1000.times { |position| get "/api/v1/current?position=#{position}"}
        json = JSON.parse(response.body)
        fib_number_at_1000_position = 26863810024485359386146727202142923967616609318986952340123175997617981700247881689338369654483356564191827856161443356312976673642210350324634850410377680367334151172899169723197082763985615764450078474174626
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
        expect { get '/api/v1/next' }.to raise_error{ ActionController::ParameterMissing }
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
        expect { get '/api/v1/current' }.to raise_error{ ActionController::ParameterMissing }
      end
    end
  end
end
