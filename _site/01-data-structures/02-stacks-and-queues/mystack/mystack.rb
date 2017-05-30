class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = @stack[@stack.length - 1]
  end

  def pop
    temp = self.top
    @stack.delete(temp)
    self.top = @stack.last
    return temp
  end

  def empty?
    @stack.length == 0
  end
end
