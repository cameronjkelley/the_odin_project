require 'spec_helper'

describe Enumerable do 
  let(:array) { [1, 2, 3, 4, 5] }
  
  describe '#my_select' do 
    it "returns an array" do 
      expect(array.my_select { |n| n } ).to be_instance_of Array
    end

    context "with non enumerable object" do 
      it { expect{ |b| "hello".my_select(&b) }.to raise_error NoMethodError }
      it { expect{ |b| 0.my_select(&b) }.to raise_error NoMethodError }
      it { expect{ |b| nil.my_select(&b) }.to raise_error NoMethodError }
    end
  end

  describe '#my_all?' do 
    context "when block is false" do 
      it "returns false" do 
        expect(array.my_all? { |n| n > 10 }).to be false
      end
    end

    context "when block is sometimes true" do 
      it "returns false" do 
        expect(array.my_all? { |n| n > 3 }).to be false
      end
    end

    context "when block is always true" do 
      it "returns true" do 
        expect(array.my_all? { |n| n > 0 }).to be true
      end
    end

    context "with non enumerable object" do 
      it { expect{ |b| "hello".my_all?(&b) }.to raise_error NoMethodError }
      it { expect{ |b| 0.my_all?(&b) }.to raise_error NoMethodError }
      it { expect{ |b| nil.my_all?(&b) }.to raise_error NoMethodError }
    end
  end

  describe '#my_none?' do
    context "when block is false" do 
      it "returns true" do 
        expect(array.my_none? { |n| n > 10 }).to be true
      end
    end

    context "when block is sometimes true" do 
      it "returns false" do 
        expect(array.my_none? { |n| n > 3 }).to be false
      end
    end

    context "with non enumerable object" do 
      it { expect{ |b| "hello".my_none?(&b) }.to raise_error NoMethodError }
      it { expect{ |b| 0.my_none?(&b) }.to raise_error NoMethodError }
      it { expect{ |b| nil.my_none?(&b) }.to raise_error NoMethodError }
    end 
  end

  describe '#my_count' do
    it "returns a number" do 
      expect(array.my_count { |n| n }).to be_instance_of Fixnum
    end 

    context "with non enumerable object" do 
      it { expect{ |b| "hello".my_count(&b) }.to raise_error NoMethodError }
      it { expect{ |b| 0.my_count(&b) }.to raise_error NoMethodError }
      it { expect{ |b| nil.my_count(&b) }.to raise_error NoMethodError }
    end
  end

  describe '#my_map' do 
    it "returns an array" do 
      expect(array.my_map { |n| n + n }).to be_instance_of Array 
    end

    context "with non enumerable object" do 
      it { expect{ |b| "hello".my_map(&b) }.to raise_error NoMethodError }
      it { expect{ |b| 0.my_map(&b) }.to raise_error NoMethodError }
      it { expect{ |b| nil.my_map(&b) }.to raise_error NoMethodError }
    end
  end

  describe '#my_inject' do 
    context "when block is given but no argument" do 
      it "returns single value" do 
        expect(array.my_inject { |sum, n| sum + n }).to eql 15
      end
    end

    context "when block and argument are given" do 
      it "returns single value" do 
        expect(array.my_inject(1) { |sum, n| sum + n }).to eql 16
      end
    end

    context "with non enumerable object" do 
      it { expect{ |b| "hello".my_inject(&b) }.to raise_error NoMethodError }
      it { expect{ |b| 0.my_inject(&b) }.to raise_error NoMethodError }
      it { expect{ |b| nil.my_inject(&b) }.to raise_error NoMethodError }
    end
  end
end