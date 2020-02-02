
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
    map_to_node = self.search(score_to_find).flatten
    map_to_node.last.score == score_to_find ? map_to_node.length - 1 : nil
  end

  def max
    return {@title => @score} if !@child_right
    @child_right.max
  end

  def min
    return {@title => @score} if !@child_left
    @child_left.min
  end

  def sort(sorted_nodes = [])
    unsorted_nodes = self.search(self.min)
    







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
