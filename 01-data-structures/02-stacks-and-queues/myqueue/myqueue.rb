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
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    temp = @queue[0]
    @queue.each_with_index do |item, index|
      index -= 1
    end
    @queue.delete(temp)
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def empty?
    @queue.length == 0
  end
end
