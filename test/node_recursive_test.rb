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

  def test_it_knows_what_it_contains
    node = Node.new()
    node.insert(61, "Bill & Ted's Excellent Adventure")
    node.insert(16, "Johnny English")
    node.insert(92, "Sharknado 3")
    node.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal true, node.include?(61)
    assert_equal false, node.include?(1)
  end

  def test_can_insert_children
    node = Node.new()
    # binding.pry

    assert_equal 0, node.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, node.insert(16, "Johnny English")
    assert_equal 1, node.insert(92, "Sharknado 3")
    assert_equal 2, node.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_can_find_depth_of_node

    node = Node.new()
    node.insert(61, "Bill & Ted's Excellent Adventure")
    node.insert(16, "Johnny English")
    node.insert(92, "Sharknado 3")
    node.insert(50, "Hannibal Buress: Animal Furnace")



    assert_equal 0, node.depth_of(61)
    assert_equal 1, node.depth_of(92)
    assert_equal 2, node.depth_of(50)
    assert_nil node.depth_of(1)
  end

  def test_it_can_find_max_score
    node = Node.new()
    node.insert(61, "Bill & Ted's Excellent Adventure")
    node.insert(16, "Johnny English")
    node.insert(92, "Sharknado 3")
    node.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3" => 92}), node.max
  end

  def test_it_can_find_min_score
    node = Node.new()
    node.insert(61, "Bill & Ted's Excellent Adventure")
    node.insert(16, "Johnny English")
    node.insert(92, "Sharknado 3")
    node.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English" => 16}), node.min
  end

  def test_it_can_be_sorted
    node = Node.new()
    node.insert(61, "Bill & Ted's Excellent Adventure")
    node.insert(16, "Johnny English")
    node.insert(92, "Sharknado 3")
    node.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal [{"Johnny English"=>16},
                  {"Hannibal Buress: Animal Furnace"=>50},
                  {"Bill & Ted's Excellent Adventure"=>61},
                  {"Sharknado 3"=>92}],
                  node.sort
  end

  def test_it_can_load_files
    node = Node.new()
    assert_equal 99, node.load("movies.txt")
  end

  def test_can_report_its_health
    node = Node.new()
    node.insert(98, "Animals United")
    node.insert(58, "Armageddon")
    node.insert(36, "Bill & Ted's Bogus Journey")
    node.insert(93, "Bill & Ted's Excellent Adventure")
    node.insert(86, "Charlie's Angels")
    node.insert(38, "Charlie's Country")
    node.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], node.health(0)
    assert_equal [[58, 6, 85]], node.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], node.health(2)
  end

end
