
class Node
  attr_reader :title, :score
  attr_accessor :child_left, :child_right, :depth, :run_recursive
  def initialize(score = 0, title = "", depth = nil)
    @title = title
    @score = score
    @child_left   = nil
    @child_right  = nil
    @depth = depth #Get rid of this next
    @run_recursive = false
  end

  def leaf?
    !(@child_left || @child_right) #No NOR comparison in ruby :(
  end

  def insert(score, title)
    if @run_recursive
      inserted_node = insert_recursive(score, title)
      inserted_node.depth
    else
      insert_iterative(score,title)
    end

  end

  # ******************* SEARCHING *******************
  




  # ******************* INSERTING *******************

  def insert_iterative(score, title)
    if @title.empty? #Is this the first insert?
      @title = title
      @score =  score
      return 0
    end

    node_to_place = Node.new(score, title)
    current_depth = 0
    current_node = self

    while node_to_place != current_node
      if score < current_node.score
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

  def insert_recursive(score, title, current_depth = 0)

    if score < self.score
      @child_left ? @child_left.insert_recursive(score, title, current_depth + 1) : @child_left = Node.new(score, title, current_depth)
    else
      @child_right ? @child_right.insert_recursive(score, title, current_depth + 1) : @child_right = Node.new(score, title, current_depth)
    end
  end



end
