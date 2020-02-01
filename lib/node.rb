
class Node
  attr_reader :name, :score
  attr_accessor :child_left, :child_right, :depth
  def initialize(score = 0, name = "", depth = 0)
    @name = name
    @score = score
    @parent = nil
    @child_left   = nil
    @child_right  = nil
    @depth = depth
  end

  def leaf?
    !(@left || @right) #No NOR comparison in ruby :(
  end

end
