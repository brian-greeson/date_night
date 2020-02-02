
class Node
  attr_reader :title, :score
  attr_accessor :child_left, :child_right, :depth, :run_recursive
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
    map_to_node = self.search(score_to_find)
    depth_to_node = 0

    while map_to_node[1]
      depth_to_node += 1
      map_to_node = map_to_node[1]
    end

    map_to_node[0].score == score_to_find ? depth_to_node : nil

  end

  def max
    current_node = self
    max_score = @score
    while current_node.child_right
      max_score = current_node.child_right.score
      current_node = current_node.child_right
    end

    max_score
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
