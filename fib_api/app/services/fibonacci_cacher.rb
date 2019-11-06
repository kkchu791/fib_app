class FibonacciCacher
  FIB_CACHE_KEY = "fib_cache"

  class << self
    def get(position)
      validate_position(position)
      fib_num = fib_cache[position]

      if fib_num.blank?
        fib_num = fibonacci_library_instance[position]
        Rails.cache.write(FIB_CACHE_KEY, fib_cache.merge(position => fib_num))
      end

      fib_num
    end

    def fibonacci_library_instance
      @@fibonacci_library_instance ||= Fibonacci.new
    end

    private

    def validate_position(position)
      if !position.is_a?(Integer)
        raise ArgumentError, "must pass an integer value"
      end

      if position.negative?
        raise ArgumentError, "must be a non negative integer"
      end
    end

    def fib_cache
      Rails.cache.fetch(FIB_CACHE_KEY) || {}
    end
  end
end
