
class Node
  attr_reader :name, :score
  attr_accessor :left, :right
  def initialize(score = 0, name = "")
    @name = name
    @score = score
    @left = nil
    @right = nil

  end

end
