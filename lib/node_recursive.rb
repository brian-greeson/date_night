
class Node
  attr_reader :title, :score
  attr_accessor :child_left, :child_right, :depth
  def initialize(score = nil, title = nil)
    @title = title
    @score = score
    @child_left   = nil
    @child_right  = nil
  end

  def leaf?
    !(@child_left || @child_right)
  end


  def depth_of(score_to_find)
    map_to_node = self.search(score_to_find).flatten
    map_to_node.last.score == score_to_find ? map_to_node.length - 1 : nil
  end

  def max
    node = self.maximum_node
    {node.title => node.score}
  end

  def min
    node = self.minimum_node
    {node.title => node.score}
  end

  def maximum_node
    return self if !@child_right
    @child_right.maximum_node
  end

  def minimum_node
    return self if !@child_left
    @child_left.minimum_node
  end

  def sort(node = self, sorted_nodes = [])
    node.sort(node.child_left, sorted_nodes) if node.child_left
    sorted_nodes << {node.title => node.score}
    node.sort(node.child_right, sorted_nodes) if node.child_right

    sorted_nodes
  end






  # ******************* INSERTING *******************
  def insert(score, title)
    if @score
      if score < @score
        return 1 + @child_left.insert(score, title) if @child_left
        @child_left = Node.new(score,title)
        return 1
      else
        return 1 + @child_right.insert(score, title) if @child_right
        @child_right = Node.new(score,title)
        return 1
      end
    else
      @score = score
      @title = title
      return 0
    end
  end

  # ******************* SEARCHING *******************
  def search(score, parent_node = self)

    if score < @score
      return [self] << @child_left.search(score, self) if @child_left
    end

    if score > @score
      return [self] << @child_right.search(score, self) if @child_right
    end
    return [self]


  end

end
