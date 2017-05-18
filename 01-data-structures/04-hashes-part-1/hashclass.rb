require_relative 'hash_item'

class HashClass
  attr_accessor :items

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    @index = index(key, @items.length)
    # new hash
    if @items[@index].nil?
      @items[@index] = HashItem.new(key, value)
    # if hash is a duplicate
    elsif @items[@index].key == key && @items[@index].value == value
      p "Item already exists"
    # keys are the same value, values are different
    elsif @items[@index].key == key && @items[@index].value != value
      resize
      @items[@index].value = value
    else
      resize
      self[key] = value
    end
  end


  def [](key)
    @items[index(key, @items.length)].value
  end

  def resize
    temp_array = @items
    @items = Array.new(temp_array.length * 2)
    temp_array.each do |item|
      unless item.nil?
        self[item.key] = item.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
