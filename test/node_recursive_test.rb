require "minitest/autorun"
require "minitest/pride"
require "./lib/node_recursive"

require "pry"

class NodeTest < Minitest::Test

  def test_it_exists
    tree = Node.new

    assert_instance_of Node, tree
  end

  def test_know_its_a_leaf
    tree = Node.new

    assert tree.leaf?
  end

  def test_knows_its_not_a_leaf
    tree = Node.new
    tree.child_left = Node.new
    tree2 = Node.new
    tree2.child_right = Node.new
    tree3 = Node.new

    assert_equal false, tree.leaf?
    assert_equal false, tree2.leaf?
    assert_equal true, tree3.leaf?
  end

  def test_knows_if_it_contains_a_score
    tree = Node.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal true, tree.include?(61)
    assert_equal false, tree.include?(1)
  end

  def test_can_insert_children
    tree = Node.new()
    # binding.pry

    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_can_find_depth_of_node

    tree = Node.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")



    assert_equal 0, tree.depth_of(61)
    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
    assert_nil tree.depth_of(1)
  end

  def test_it_can_find_max_score
    tree = Node.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3" => 92}), tree.max
  end

  def test_it_can_find_min_score
    tree = Node.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English" => 16}), tree.min
  end

  def test_it_can_be_sorted
    tree = Node.new()
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal [{"Johnny English"=>16},
                  {"Hannibal Buress: Animal Furnace"=>50},
                  {"Bill & Ted's Excellent Adventure"=>61},
                  {"Sharknado 3"=>92}],
                  tree.sort
  end

  def test_it_can_load_files
    tree = Node.new()
    assert_equal 99, tree.load("movies.txt")
  end

  def test_can_report_its_health

    tree = Node.new()
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], tree.health(0)
    assert_equal [[58, 6, 85]], tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end

  def test_knows_how_many_leaves_on_tree
    tree = Node.new()
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal 2, tree.leaves
  end

  def test_knows_height_of_itself
    tree = Node.new()
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    
    assert_equal 4, tree.height()

  end

end
