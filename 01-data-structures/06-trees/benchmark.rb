require 'benchmark'
require_relative 'heap/node'
require_relative 'binary_tree/node'
require_relative 'binary_tree/binary_search_tree'
require_relative 'heap/binary_heap'

tree_root = Node.new("tree_root", 123)
heap_root = Node.new("heap_root", 123)
tree = BinarySearchTree.new(tree_root)
heap = MinBinaryHeap.new(heap_root)

Benchmark.bm do |x|
  x.report("tree insert") do
    10000.times do
      node = Node.new("tree", rand(0..100000))
      tree.insert(tree_root, node)
    end
  end
   x.report("heap insert") do
     10000.times do
       node = Node.new("heap", rand(0..100000))
       heap.insert(heap_root, node)
     end
   end
end

Benchmark.bm do |x|
  x.report("tree find") do
      tree.find(tree_root, 50000)
  end
   x.report("heap find") do
     heap.find(heap_root, 50000)
   end
end

Benchmark.bm do |x|
  x.report("tree delete") do
      tree.delete(tree_root, 50000)
  end
   x.report("heap delete") do
     heap.delete(heap_root, 50000)
   end
end
