
class Node
  attr_reader :name, :score
  attr_accessor :left, :right, :depth
  def initialize(score = 0, name = "", depth = 0)
    @name = name
    @score = score
    @left = nil
    @right = nil
    @depth = depth
  end

  def leaf?
    !(@left || @right) #No NOR comparison in ruby :(
  end

end
