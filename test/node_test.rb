require "minitest/autorun"
require "minitest/pride"
require "./lib/node"

require "pry"

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new

    assert_instance_of Node, node
  end

end
