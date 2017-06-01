require 'benchmark'

def fib(n)
   fib_0 = 0
   fib_1 = 1
   (0...n).each do
     temp = fib_0
     fib_0 = fib_1
     fib_1 = temp + fib_1
   end
   fib_1
 end

puts Benchmark.measure { fib(20) }
