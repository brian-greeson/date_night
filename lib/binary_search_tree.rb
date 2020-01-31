class BinarySearchTree

  def initialize()
    @nodes = {}
    @current_depth = 0
  end

  def insert(score = 0, title = "")
    @nodes[score] = Node.new(score, title)
    # do future magic here
    @current_depth
  end

end
