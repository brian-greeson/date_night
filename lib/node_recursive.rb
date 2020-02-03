require "CSV"
class Node
  attr_reader :title, :score
  attr_accessor :child_left, :child_right, :depth
  def initialize(score = nil, title = nil)
    @title = title
    @score = score
    @child_left   = nil
    @child_right  = nil
  end

# **************** SHAPE ****************
  def leaf?
    !(@child_left || @child_right)
  end

  def include?(score)
    return false if !@score
    map_to_node = self.search(score).flatten
    map_to_node.last.score == score
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

  def sort(node = self, ordered_nodes = [])
    return if node.nil?

    sort(node.child_left, ordered_nodes)
    ordered_nodes << {node.title => node.score}
    sort(node.child_right, ordered_nodes)
    ordered_nodes
  end

  def health(depth = 0)
    nodes_at_depth = self.level_order(self , depth)
    health_report = []
    nodes_at_depth.each do |node|
      node_health = []
      node_health << node.score
      node_health << total_child_nodes = in_order(node).length
      node_health << 100 * (node_health[1] / in_order(self).length.to_f )
      node_health[2] = node_health[2].to_i
      health_report << node_health
    end

    health_report
  end

  def leaves
    self.leaf_search.length
  end

  def height(node = self)
    if node.nil?
      return -1
    end

      left_branch = height(node.child_left)
      right_branch = height(node.child_right)
      if left_branch > right_branch
        return left_branch + 1
      else
        return right_branch + 1
      end
  end

  # ******************* LOAD FILE *******************

  def load(filename)
    movies_loaded = 0
    CSV.foreach(filename) do |line|
      score = line[0]
      title = line[1]
      if !self.include?(score)
        self.insert(score, title)
        movies_loaded += 1
      end
    end
    movies_loaded
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

  def leaf_search(node = self, leaf_nodes = [])
    return if node.nil?
    if node.leaf?
      leaf_nodes << node
    end
    self.leaf_search(node.child_left, leaf_nodes)
    self.leaf_search(node.child_right, leaf_nodes)

    leaf_nodes
  end

# **************** TRAVERSING ********************
  def level_order(node = self, depth = 0, ordered_nodes = [])
    return if node.nil?
    if depth == 0
      return ordered_nodes << node
    end
    self.level_order(node.child_left, depth - 1 , ordered_nodes)
    self.level_order(node.child_right, depth - 1, ordered_nodes)

    ordered_nodes
  end

  def in_order(node = self, ordered_nodes = [])
    return if node.nil?

    self.in_order(node.child_left, ordered_nodes)
    ordered_nodes << node
    self.in_order(node.child_right, ordered_nodes)

    ordered_nodes
  end

  def pre_order(node = self, ordered_nodes = [])
    return if node.nil?

    ordered_nodes << node
    self.pre_order(node.child_left, ordered_nodes)
    self.pre_order(node.child_right, ordered_nodes)


    ordered_nodes
  end

  def post_order(node = self, ordered_nodes = [])
    return if node.nil?

    self.post_order(node.child_left, ordered_nodes)
    self.post_order(node.child_right, ordered_nodes)
    ordered_nodes << node

    ordered_nodes
  end


end
