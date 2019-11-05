class Api::V1::FibNumbersController < ApplicationController
  def current
    render json: {
      status: :ok,
      number: FibonacciCacher.get(position),
    }
  end

  def next
    render json: {
      status: :ok,
      number: FibonacciCacher.get(position + 1),
    }
  end

  def previous
    render json: {
      status: :ok,
      number: FibonacciCacher.get(position - 1),
    }
  end

  private

  def position
    @position ||= params.fetch(:position).to_i
  end
end
