class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :queue

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def dequeue
    @head = @queue[1]
    0.upto(@queue.length - 1) do |i|
      if i == @queue.length - 1
        @queue.delete_at(i)
      else
        @queue[i] = @queue[i+1]
      end
    end
  end

  def empty?
    if @queue.length > 0
      return false
    else
      return true
    end
  end
end
