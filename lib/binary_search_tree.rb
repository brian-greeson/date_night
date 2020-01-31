class BinarySearchTree

  def initialize()
    @nodes = []
  end

  def insert(score = 0, title = "")
    @nodes << Node.new(score, title)
    return 0 if @nodes.length == 1

    current_node = @nodes[0]
    current_depth = 0
    keep_searching = true

    while keep_searching
      current_depth += 1
      if score < current_node.score
        if current_node.left
          current_node = current_node.left
        else
          current_node.left = Node.new(score, title)
          keep_searching = false
        end
      elsif current_node.right
        current_node = current_node.right
      else
        current_node.right = Node.new(score, title)
        keep_searching = false
      end
    end
    current_depth
  end

  def include?(score = nil)
    current_node = @nodes[0]
    return true if score == current_node.score
    found = false
    until found || (current_node.left || current_node.right)
      if score < current_node.score
        current_node = current_node.left
      else
        current_node = current_node.right
      end
      found = true if score == current_node.score
    end
    found
  end

end
