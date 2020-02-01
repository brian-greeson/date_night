require "minitest/autorun"
require "minitest/pride"
require "./lib/node"

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

    refute node.leaf?
    refute node2.leaf?
    assert node3.leaf?
  end

  def test_can_insert_children
    node = Node.new()
    
    assert_equal 0, node.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, node.insert(16, "Johnny English")
    assert_equal 1, node.insert(92, "Sharknado 3")
    assert_equal 2, node.insert(50, "Hannibal Buress: Animal Furnace")

  end



end
