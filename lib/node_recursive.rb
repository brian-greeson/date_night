
class Node
  attr_reader :title, :score
  attr_accessor :child_left, :child_right, :depth, :run_recursive
  def initialize(score = 0, title = nil)
    @title = title
    @score = score
    @child_left   = nil
    @child_right  = nil
  end

  def leaf?
    !(@child_left || @child_right) #No NOR comparison in ruby :(
  end

  # ******************* INSERTING *******************
  def insert(score, title)

    # binding.pry
    if @title
      node_to_insert = Node.new(score,title)
      # binding.pry
      if node_to_insert.score < @score
        if @child_left
          return 1 + @child_left.insert(node_to_insert.score, node_to_insert.title)
        else
          @child_left = node_to_insert
          return 1
        end
      else
        if @child_right
          return 1 + @child_right.insert(score, node_to_insert.title)
        else
          @child_right = node_to_insert
          return 1
        end
      end
    else
      @score = score
      @title = title
      return 0
    end

  end

  # ******************* SEARCHING *******************
  def depth_of(score_to_find, current_depth = 0)
    # return nil if current_node == nil
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






end
