require_relative 'fibonacci_iter'
require 'benchmark'

def fib_rec(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
    return fib_rec(n-1) + fib_rec(n-2)
  end
end

puts "Recursive"
puts fib_rec(20)

n = 20
Benchmark.bm do |x|
  x.report("Recursive:") {
    fib_rec(n)
  }
  x.report("Iterative:") {
    fib_iter(n)
  }
end
