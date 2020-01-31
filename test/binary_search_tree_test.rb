require "minitest/autorun"
require "minitest/pride"
require "./lib/binary_search_tree"
require "./lib/node"

require "pry"

class BinarySearchTreeTest < Minitest::Test

  def test_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_it_can_create_a_node
    tree = BinarySearchTree.new

    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

  def test_it_can_add_multiple_nodes
    tree = BinarySearchTree.new
    
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1,tree.insert(16, "Johnny English")
    assert_equal 1,tree.insert(92, "Sharknado 3")
    assert_equal 2,tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

end


# tree.insert(61, "Bill & Ted's Excellent Adventure")
# # => 0
# tree.insert(16, "Johnny English")
# # => 1
# tree.insert(92, "Sharknado 3")
# # => 1
# tree.insert(50, "Hannibal Buress: Animal Furnace")
# # => 2
