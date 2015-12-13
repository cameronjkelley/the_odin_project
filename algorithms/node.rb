class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
  end

  def build_tree(array)
    return nil if array.size == 0
    m = array.size / 2
    node = Node.new(array[m])
    return node if array.size == 1
    node.left  = build_tree(array[0..m])
    node.right = build_tree(array[m+1..-1]) 
    node
  end
end