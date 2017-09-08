class LinkedList
  include Enumerable
  require './node.rb'
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      tmp = @head
      while tmp.next_node != nil
        tmp = tmp.next_node
      end
      tmp.next_node = Node.new(value)
      self.tail
    end
  end

  def prepend(value)
    temp = Node.new(value, @head)
    @head = temp
  end

  def size
    self.count
  end

  def tail
    tmp = @head
    until tmp.next_node.nil?
      tmp = tmp.next_node
    end
    @tail = tmp
  end

  def each
    return nil if @head.nil?
    node = @head
    until node.nil?
      yield node
      node = node.next_node
    end
  end

  def at(index)
    if @head.next_node
      node = @head
      i = 0
      while i < index
        node = node.next_node
        i += 1
      end
      return node
    else
      return nil
    end
  end

  def pop
    node = at(size - 2)
    node.next_node = nil
    self.tail
  end

  def contains?(key)
    node = @head
    size.times {
      val = node.value
      return true if val == key
      node = node.next_node
    }
    return false
  end

  def find(data)
    return nil if !contains?(data)
    index = 0
    node = @head
    until node.value == data
      node = node.next_node
      index += 1
    end
    index
  end

  def to_s
    str = ""
    self.each { |node| str += "( #{node.value} ) -> " }
    str += "( nil )"
    str
  end

  def insert_at(index, value)
    if index == 0
      prepend(value)
    else
      tmp = at(index - 1).next_node
      at(index - 1).next_node = Node.new(value)
      at(index - 1).next_node.next_node = tmp
    end
  end

  def remove_at(index)
    self.tail
    if at(index - 1).next_node == self.tail
      pop
    else
      tmp = at(index - 1).next_node.next_node
      at(index - 1).next_node = tmp
    end
  end

end
