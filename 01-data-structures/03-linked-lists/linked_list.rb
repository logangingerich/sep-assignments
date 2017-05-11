require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail == nil && @head == nil
      @tail = node
      @head = node
    elsif @tail == nil
      node = @tail
    else
      @tail.next = node
      node.prev = @tail
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp = @tail.prev
    @tail = nil
    @tail = temp
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != nil
      puts "#{current_node.data}"
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current_node = @head
    if current_node == node
      @head = @head.next
    elsif @tail == node
      @tail = @tail.prev
    else
      while (current_node.next != nil)&&(current_node.next != node)
        current_node = current_node.next
      end
      current_node.next = current_node.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
    else
      temp = @head
      @head = node
      @head.next = temp
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    @head = @head.next
    return temp
  end
end
