
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

  def run_recursive=(choice)
    @run_recursive = choice
    @child_left.run_recursive = choice if @child_left
    @child_right.run_recursive = choice if @child_right
  end

  def set_entire_tree_recursion
    self.run_recursive = @run_recursive
  end

  def leaf?
    !(@child_left || @child_right) #No NOR comparison in ruby :(
  end

  def insert(score_to_find, title)
    if @run_recursive
      self.set_entire_tree_recursion
      inserted_node = insert_recursive(score_to_find, title)
      inserted_node.depth
    else
      insert_iterative(score_to_find,title)
    end

  end

  def depth_of(score_to_find)
    if @run_recursive
      self.set_entire_tree_recursion
      depth_of_recursive(score_to_find)
    else
      depth_of_iterative(score_to_find)
    end
  end


  # ******************* SEARCHING *******************

  def depth_of_iterative(score_to_find)
    return 0 if score_to_find == @score

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

  def depth_of_recursive(score_to_find, current_depth = 0)
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

  def insert_iterative(score_to_find, title)
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

  def insert_recursive(score_to_find, title, current_depth = 0)
    if @title.empty? #Is this the first insert?
      @title = title
      @score =  score_to_find
      @depth = current_depth
      return self
    end

    if score_to_find < self.score
      @child_left ? @child_left.insert_recursive(score_to_find, title, current_depth + 1) : @child_left = Node.new(score_to_find, title, current_depth)
    else
      @child_right ? @child_right.insert_recursive(score_to_find, title, current_depth + 1) : @child_right = Node.new(score_to_find, title, current_depth)
    end
  end



end
