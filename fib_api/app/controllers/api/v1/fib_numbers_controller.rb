class Api::V1::FibNumbersController < ApplicationController
  def current
    render json: {
      status: :ok,
      number: FibonacciCacher.get(position),
    }
  rescue => e
    render json: { status: 400, error: e.message }
  end

  def next
    render json: {
      status: :ok,
      number: FibonacciCacher.get(position + 1),
    }
  rescue => e
    render json: { status: 400, error: e.message }
  end

  def previous
    render json: {
      status: :ok,
      number: FibonacciCacher.get(position - 1),
    }
  rescue => e
      render json: { status: 400, error: e.message }
  end

  private

  def position
    @position ||= params.fetch(:position).to_i
  end
end
