require "minitest/autorun"
require "minitest/pride"
require "./lib/node_recursive"

require "pry"

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new

    assert_instance_of Node, node
  end

  def test_know_its_a_leaf
    node = Node.new

    assert node.leaf?
  end

  def test_knows_its_not_a_leaf
    node = Node.new
    node.child_left = Node.new
    node2 = Node.new
    node2.child_right = Node.new
    node3 = Node.new

    assert_equal false, node.leaf?
    assert_equal false, node2.leaf?
    assert_equal true, node3.leaf?
  end

  def test_can_insert_children_recursively
    node = Node.new()
    # binding.pry

    assert_equal 0, node.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, node.insert(16, "Johnny English")
    assert_equal 1, node.insert(92, "Sharknado 3")
    assert_equal 2, node.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_can_find_depth_of_node_recursively
    skip
    node = Node.new()
    # binding.pry

    node.insert(61, "Bill & Ted's Excellent Adventure")
    node.insert(16, "Johnny English")
    node.insert(92, "Sharknado 3")
    node.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, node.depth_of(92)
    assert_equal 2, node.depth_of(50)
  end


end
