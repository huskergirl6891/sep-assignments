def big_o_calc(n)
  for i in 1..(n) do
    puts i.to_s + ", " + i.to_s
  end
end

x = 10
puts "Number of iterations for linear search for n = " + x.to_s
puts big_o_calc(x)
