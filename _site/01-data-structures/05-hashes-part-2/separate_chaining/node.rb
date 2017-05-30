class Node
  attr_accessor :next
  attr_accessor :key
  attr_accessor :prev
  attr_accessor :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end
