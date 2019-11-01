class FibCalculator

  def update(user, action)
    fib_num = user.fib_number

    if action == "next"
      fib_num.update(
        current: fib_num.next,
        next: fib_num.current + fib_num.next,
        previous: fib_num.current
      )
    else
      fib_num.update(
        current: fib_num.previous,
        next: fib_num.current,
        previous: fib_num.current - fib_num.previous
      )
    end
  end
end
