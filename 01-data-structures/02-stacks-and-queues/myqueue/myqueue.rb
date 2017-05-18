class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue.unshift(element)
    #@head = @queue[0]
    #@tail = @queue[-1]
  end

  def dequeue
    temp = @queue.last
    @queue.delete(temp)
    return temp
  end

  def empty?
    @queue.length == 0
  end
end
