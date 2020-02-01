class BinarySearchTree

  def initialize()
    @nodes = []
    @root_node = nil
  end

  def insert(score = 0, title = "")
    if !@root_node
      @root_node = Node.new(score, title)
      return 0
    end
    self.insert_iterative(score, title)
  end

  def include?(score = nil)
    # return nil if !score #GuardClause

    search_iterative_for_score(score) == nil ? false : true
  end

  def depth_of(score)
    search_iterative_for_score(score)
  end

  def search_by_score(score)
    search_recusivly_by_score(score)
  end

  # *************** INSERTING ***************

  def insert_iterative(score, title)
    node_to_place = Node.new(score, title)
    depth = 0

    if !@root_node
      @root_node = node_to_place
      return depth
    end

    current_node = @root_node

    while node_to_place != current_node
      if score < current_node.score
        current_node.child_left = node_to_place if !current_node.child_left
        current_node = current_node.child_left
      else
        current_node.child_right = node_to_place if !current_node.child_right
        current_node = current_node.child_right
      end
      depth += 1
    end
    return depth
  end


# *************** SEARCHING   ***************

  def search_iterative_for_score(score)
    current_node = @root_node
    depth = 0
    # binding.pry
    while current_node.score != score
      if score < current_node.score
          current_node = current_node.child_left
          depth += 1
      else
        current_node = current_node.child_right
        depth += 1
      end
      break if !current_node # return false if current_node == nil
    end
    # binding.pry
    current_node == nil ?  nil : depth
  end

  def search_recusivly_by_score(score_to_find, current_node, depth = 0)

    if score_to_find < current_node.score
      search_recusivly_by_score(score_to_find, current_node.child_left, depth + 1)
    else
      search_recusivly_by_score(score_to_find, current_node.child_right, depth + 1)
    end
    # we either found something or nothing at this point
    if current_node == nil ? 


  end


end
