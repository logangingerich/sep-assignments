require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @count = 0.0
    @items = Array.new(size)
  end

  def []=(key, value)
    @index = index(key, @items.length)
    if @items[@index] == nil
      @items[@index] = LinkedList.new
    end
    @items[@index].add_to_tail(Node.new(key, value))
    @count += 1
    if load_factor >= @max_load_factor
      resize
    end
  end

  def [](key)
    @index = index(key, @items.length)
    current_node = @items[@index].head
    while current_node != nil
      if current_node.key == key
        return current_node.value
      else
        current_node = current_node.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @count / @items.length
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp_array = @items
    @items = Array.new(temp_array.length * 2)
    temp_array.each do |item|
      unless item == nil
        current_node = item.head
        @index = index(current_node.key, @items.length)
        if @items[@index] == nil
          @items[@index] = LinkedList.new
          @items[@index].add_to_tail(Node.new(current_node.key, current_node.value))
          if load_factor >= @max_load_factor
            resize
          end
          current_node = current_node.next
        else
          @items[@index].add_to_tail(Node.new(current_node.key, current_node.value))
          if load_factor >= @max_load_factor
            resize
          end
          current = current.next
        end
      end
    end
  end

  def print_status
    if @count === 0.0
      puts "No entries in hash, load factor is 0."
    else
      @items.each do |item|
        unless item == nil
          current_node = item.head
          @index = index(current_node.key, @items.length)
          until current_node == nil
            puts "Entry #{current_node} is at index #{index}."
            current_node = current_node.next
          end
        end
      end
      puts "Load Factor is #{@item_count / @items.length}."
    end
  end
end
