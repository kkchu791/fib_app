class Api::V1::FibNumbersController < ApplicationController
  def current
    fib_num = check_cache(params[:position].to_i)

    render json: {
      status: :ok,
      number: fib_num,
    }
  end

  def next
    fib_num = check_cache(params[:position].to_i + 1)

    render json: {
      status: :ok,
      number: fib_num,
    }
  end

  def previous
    fib_num = check_cache(params[:position].to_i - 1)

    render json: {
      status: :ok,
      number: fib_number[params[:position].to_i - 1],
    }
  end

  private

  def fib_number
    @fib_number = Fibonacci.new
  end

  def check_cache(position)
    cache = Rails.cache.read(position)

    if cache.present?
      fib_num = cache
    else
      fib_num = fib_number[params[:position].to_i]
      Rails.cache.write(params[:position].to_i, fib_num)
    end

    fib_num
  end
end
