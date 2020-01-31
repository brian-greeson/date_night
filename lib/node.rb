
class Node

  def initialize(name = "", score = 0)
    @name = name
    @score = score
    @neighbors = {left: nil ,
                  right: nil}
  end

end
