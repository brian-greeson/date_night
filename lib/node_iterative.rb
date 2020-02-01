
class Node
  attr_reader :title, :score
  attr_accessor :child_left, :child_right, :depth
  def initialize(score = 0, title = "", depth = nil)
    @title = title
    @score = score
    @child_left   = nil
    @child_right  = nil
    @depth = depth #Get rid of this next
  end

  def leaf?
    !(@child_left || @child_right) #No NOR comparison in ruby :(
  end

  # ******************* INSERTING *******************
  def insert(score_to_find, title)
    if @title.empty? #Is this the first insert?
      @title = title
      @score =  score_to_find
      return 0
    end

    node_to_place = Node.new(score_to_find, title)
    current_depth = 0
    current_node = self

    while node_to_place != current_node
      if score_to_find < current_node.score
        current_node.child_left = node_to_place if !current_node.child_left
        current_node = current_node.child_left
      else
        current_node.child_right = node_to_place if !current_node.child_right
        current_node = current_node.child_right
      end
      current_depth += 1
    end

    return current_depth
  end

  # ******************* SEARCHING *******************
  def depth_of(score_to_find) 
    eturn 0 if score_to_find == @score

    current_node = self
    current_depth = 0

    while score_to_find != current_node.score || current_depth == nil
      current_depth += 1

      if score_to_find < current_node.score
        current_node.child_left ? current_node = current_node.child_left : current_depth = nil
      else
        current_node.child_right ? current_node = current_node.child_right : current_depth = nil
      end
    end

    return current_depth
  end

end
