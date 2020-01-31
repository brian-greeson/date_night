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
    node.left = Node.new
    node2 = Node.new
    node2.right = Node.new
    node3 = Node.new

    refute node.leaf?
    refute node2.leaf?
    assert node3.leaf?
  end

  def test_starts_at_depth_0
    node = Node.new

    assert_equal 0, node.depth
  end

  def test_can_be_at_another_depth
    node = Node.new(42, "life")

    assert_equal 0, node.depth

    node.depth = 4

    assert_equal 4, node.depth
  end

end
