require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @count = 0.0
  end

  def []=(key, value)
    index = index(key, @items.length)
    if @items[index] == nil
      @items[index] = Node.new(key, value)
      @count += 1
    elsif @items[index].key == key
      if @items[index].value != value
        @items[index].value = value
        if next_open_index(0) == -1
          resize
        end
      end
    else
      next_open = next_open_index(index)
      if next_open == -1
        resize
        self[key] = value
        @count += 1
      elsif @items[next_open] == nil
        @items[next_open] = Node.new(key, value)
        @count += 1
      end
    end
  end

  def [](key)
    @index = index(key, @items.length)
    while @index != @items.length
      if @items[@index].key != key
        @index += 1
      elsif @items[@index].key === key
        return @items[@index].value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    until @items[index] == nil
      index += 1
    end
    if index >= @items.length
      return -1
    else
      return index
    end
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
      unless item.nil?
        self[item.key] = item.value
      end
    end
  end

  def print_status
    if @count == 0.0
      puts "No entries in hash, load factor is 0."
    else
      @items.each do |item|
        unless item.nil?
          index = index(item.key, @items.length)
            puts "Entry #{item} is located at index #{index}"
        end
      end
      puts "Load Factor for hash is #{@count / @items.length}."
    end
  end
end
