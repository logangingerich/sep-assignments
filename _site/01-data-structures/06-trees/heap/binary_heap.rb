require_relative 'node'

class MinBinaryHeap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, data)
    #if data rating is less than root, data becomes the new root
    #then, insert is run recursively with the new root, using
    #old root as a new data
    if root.rating > data.rating
      temp = root
      @root = data
      data = temp
      insert(@root, data)
    else
      if root.left.nil?
        root.left = data
      elsif root.right.nil? && root.left != nil
        root.right = data
      elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
        insert(root.right, data)
      elsif root.left != nil && root.right != nil
        insert(root.left, data)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root == nil || data == nil
      nil
    else
      if root.title == data
        root
      # Uses recursion to move down left, then right side of tree
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if data == nil
      nil
    else
      node_to_delete = find(root, data)
      if node_to_delete.nil?
        nil
      else
        node_to_delete.title = nil
        node_to_delete.rating = nil
      end
    end
  end

  # Recursive Breadth First Search
  def print(children=nil)
    queue = Queue.new
    #Add the root to the queue
    queue.enq(@root)
    #loop while queue isn't empty
    while !queue.empty?
      #take and print value in queue
      value = queue.deq
      puts "#{value.title}: #{value.rating}" if !value.title.nil?
      #search left then right for new queue item
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end
end
