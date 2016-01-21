require 'spec_helper'

describe 'bubble_sort' do
  it "returns an array" do 
    expect(bubble_sort([5, 1, 4, 2, 3])).to be_an_instance_of Array 
  end

  it "sorts integers" do 
    expect(bubble_sort([5, 1, 4, 2, 3])).to eql [1, 2, 3, 4, 5]
  end

  it "sorts negative integers" do 
    expect(bubble_sort([2, -1, 0, -2, 1])).to eql [-2, -1, 0, 1, 2]
  end
end

describe 'bubble_sort_by' do
  array = [3, 1, 5, 2, 4]

  it "sorts integers" do 
    expect(bubble_sort_by(array) { |l, r| l <=> r }).to eql [1, 2, 3, 4, 5]
  end
  
  it "sorts in descending order" do 
    expect(bubble_sort_by(array) { |l, r| r <=> l }).to eql [5, 4, 3, 2, 1]
  end

  it "sorts words" do 
    expect(bubble_sort_by(["hello", "hi", "hey"]) { |l, r| l.length - r.length }).to eql ["hi", "hey", "hello"]
  end
end