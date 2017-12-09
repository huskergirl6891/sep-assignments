def fib_iter(n)
  fib_0 = 0
  fib_1 = 1
  for i in 0..(n-1) do
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end
  return fib_0
end

puts "Iterative"
puts fib_iter(20)
