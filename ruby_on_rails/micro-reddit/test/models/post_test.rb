require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @post = Post.new(title: "Example Post", body: "This is an example post.")
  end

  test "should be valid" do 
    assert @post.valid?
  end

  test "title should not be empty" do 
    @post.title = ""
    assert_not @post.valid?
  end

  test "body should not be empty" do 
    @post.body = ""
    assert_not @post.valid?
  end
end