class Api::V1::FibNumbersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def current
    render json: {
      status: :ok,
      number: fib_number[params[:position].to_i],
    }
  end

  def next
    render json: {
      status: :ok,
      number: fib_number[params[:position].to_i + 1],
    }
  end

  def previous
    render json: {
      status: :ok,
      number: fib_number[params[:position].to_i - 1],
    }
  end

  private

  def fib_number
    @fib_number = Fibonacci.new
  end
end
