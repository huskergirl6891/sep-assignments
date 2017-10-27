# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members
  attr_accessor :front, :back, :middle

  def initialize
    self.members = []
  end

  def join(person)
    self.members[self.members.length] = person
  end

  def leave(person)
    self.members.delete(person)
  end

  def front
    self.front = self.members[0]
  end

  def middle
    self.middle = self.members[self.members.length / 2]
  end

  def back
    self.back = self.members[self.members.length - 1]
  end

  def search(person)
    self.members.each do |i|
      if i == person
        return i
      end
    end
    return nil
  end

  private

  def index(person)
    self.members.each_with_index do |i, index|
      if i == person
        return index
      end
    end
  end

end
