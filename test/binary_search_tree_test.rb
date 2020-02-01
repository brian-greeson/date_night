require "minitest/autorun"
require "minitest/pride"
require "./lib/binary_search_tree"
require "./lib/node"

require "pry"

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new

  end

  def test_it_exists
    assert_instance_of BinarySearchTree, @tree
  end


  def test_it_can_add_multiple_nodes

    assert_equal 0, @tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, @tree.insert(16, "Johnny English")
    assert_equal 1, @tree.insert(92, "Sharknado 3")
    assert_equal 2, @tree.insert(50, "Hannibal Buress: Animal Furnace")

  end

  def test_it_knows_if_a_score_is_in_the_tree

    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal true, @tree.include?(61)
    assert_equal false, @tree.include?(1)
    assert_equal true, @tree.include?(16)
  end

  def test_knows_depth_of_score

    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
    assert_nil nil, @tree.depth_of(1)

  end

end
