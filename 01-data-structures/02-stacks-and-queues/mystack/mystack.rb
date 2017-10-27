class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.length.downto(1) do |i|
      @stack[i] = @stack[i - 1]
    end
    @stack[0] = item
    self.top = @stack[0]
  end

  def pop
    self.top = @stack[1]
    temp = @stack[0]
    0.upto(@stack.length - 1) do |i|
      if i == @stack.length - 1
        @stack[i] = nil
      else
        @stack[i] = @stack[i+1]
      end
    end
    return temp
  end

  def empty?
    if @stack.length > 0
      return false
    else
      return true
    end
  end
end
