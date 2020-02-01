
class Node
  attr_reader :title, :score
  attr_accessor :child_left, :child_right, :depth, :run_recursive
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

  # ******************* SEARCHING *******************
  def depth_of(score_to_find, current_depth = 0)
    # return nil if current_node == nil
    binding.pry
    if score_to_find == @score
      return current_depth
    end

    if score_to_find < @score
      @child_left.depth_of_recursive(score_to_find, current_depth + 1)
    else
      @child_right.depth_of_recursive(score_to_find, current_depth + 1)
    end
    return current_depth
  end



  # ******************* INSERTING *******************


  def insert(score_to_find, title, current_depth = 0)

    if score_to_find < self.score
      if @child_left
        @child_left.insert(score_to_find, title, current_depth + 1)
      else
        @child_left = Node.new(score_to_find, title, current_depth)
      end

    else

      if @child_right
       @child_right.insert(score_to_find, title, current_depth + 1)
     else
       @child_right = Node.new(score_to_find, title, current_depth)
     end
    end
  end



end
