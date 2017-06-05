require 'benchmark'
require_relative 'bubble_sort'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'selection_sort'

array = []
50.times do
  array.push(Random.rand(0...100))
end

puts "Bubble Sort"
puts Benchmark.measure { bubble_sort(array) }

puts "Bucket Sort"
puts Benchmark.measure { bucket_sort(array) }

puts "Heap Sort"
puts Benchmark.measure { heap_sort(array) }

puts "Insertion Sort"
puts Benchmark.measure { insertion_sort(array) }

puts "Merge Sort"
puts Benchmark.measure { merge_sort(array) }

puts "Quick Sort"
puts Benchmark.measure { quick_sort(array) }

puts "Selection Sort"
puts Benchmark.measure { selection_sort(array) }
