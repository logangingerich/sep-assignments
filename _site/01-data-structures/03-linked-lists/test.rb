require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

linked_list = LinkedList.new
arr = []
n1 = Node.new('Logan')

puts Benchmark.measure {
  puts 'Array creation test'
  10000.times do |x|
    arr.push(n1)
  end
}

puts Benchmark.measure {
  puts 'Linked List creation test'
  10000.times do
    linked_list.add_to_tail(n1)
  end
}

5000.times do
  arr.push(n1)
end
puts Benchmark.measure {
  puts 'Array access item 5,000 test'
  arr[4999]
}

5000.times do
  linked_list.add_to_tail(n1)
end
puts Benchmark.measure {
  puts 'Linked List access item 5,000 test'
  node = linked_list.head
  5000.times do
    node = node.next
  end
}

puts Benchmark.measure {
  puts 'Array delete item 5,000 test'
  arr.delete_at(4999)
}

puts Benchmark.measure {
  puts 'Linked List delete item 5,000 test'
  node = linked_list.head
  5000.times do
    node = node.next
  end
  linked_list.delete(node)
}
