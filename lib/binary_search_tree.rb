class BinarySearchTree

  def initialize()
    @nodes = {}
  end

  def insert(score = 0, title = "")
    @nodes[score] = Node.new(score, title)


  end

end
