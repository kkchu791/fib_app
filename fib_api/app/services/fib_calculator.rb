class FibCalculator
  def self.update(user, action)
    fib_num = user.fib_number

    if action == "next"
      fib_num.update(
        current: fib_num.next,
        next: fib_num.current + fib_num.next,
        previous: fib_num.current
      )
    elsif action == "previous"
      fib_num.update(
        current: fib_num.previous,
        next: fib_num.current,
        previous: fib_num.current - fib_num.previous
      )
    else
      fib_num.update(
        current: 0,
        next: 1,
        previous: 0,
      )
    end
  end
end
