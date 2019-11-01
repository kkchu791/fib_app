class Api::V1::FibNumbersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def current
    render json: {
      status: :ok,
      number: fib_number.current,
    }
  end

  def next
    FibCalculator.update(current_user, 'next')

    render json: {
      status: :ok,
      number: fib_number.current,
    }
  end

  def previous
    FibCalculator.update(current_user, 'previous')

    render json: {
      status: :ok,
      number: fib_number.current,
    }
  end

  private

  def fib_number
    current_user.fib_number
  end
end
