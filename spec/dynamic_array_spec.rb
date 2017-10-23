require "dynamic_array"
require "rspec/expectations"

# I've listed the public methods required for my API and am writing tests for each of those methods prior to implementing them
describe DynamicArray do

  before(:all) do
    subject = DynamicArray.new
  end


  describe "DynamicArray#initialize" do
    it "starts out empty" do
      expect(subject.length).to eq(0)
    end
  end

  describe "DynamicArray#[]" do

    it "returns an item when given a negative index in bounds" do
      subject.push("apple")
      expect(subject[-1]).to eq("apple")
    end

    it "raises error when given a negative index out of bounds" do
      subject.push("apple")
      expect do
        subject[-2]
      end.to raise_error("index out of bounds")
    end

  end

  describe "DynamicArray#[]=" do

    it "changes an item at a given index" do
      subject.push("apple")
      subject[0] = "orange"
      expect(subject[0]).to eq("orange")
    end

    it "raises error when asked to change an item at a given positive index out of bounds" do
      expect do
        subject[0] = "apple"
      end.to raise_error("index out of bounds")
    end

    it "raises error when asked to change an item at a given negative index out of bounds" do
      expect do
        subject[-1] = "apple"
      end.to raise_error("index out of bounds")
    end

  end


  # Ultimately, I'd like to design the DynamicArray API
  # ...such that all methods run at constant time complexity (on average).
  # To test time complexity, I should be testing the actual time complexities experienced in this environment
  # ...by comparing my API method run times to methods with linear time complexity
  # If, instead, I tested whether or not a 'resize' helper method is called (doubles size of underlying array to acheive constant time on avg),
  # ...then I'm testing the implementation not the behavior. That misses the point of TDD.


  describe "DynamicArray#push" do

    it "grows when it accepts a new item" do
      subject.push("apple")
      expect(subject.length).to eq(1)
    end

    it "retrieves the item that was added to it" do
      subject.push("apple")
      expect(subject[0]).to eq("apple")
    end

    it "adds the item to the end of a larger array" do
      subject.push("apple")
      subject.push("orange")
      expect(subject[1]).to eq("orange")
    end

    it "returns the object on which it is called" do
      result = subject.push("apple")
      expect(result[0]).to eq("apple")
    end

    xit "runs faster than linear time on average" do
    end

  end

  describe "DynamicArray#pop" do

    it "removes an item and have correct length" do
      subject.push("apple")
      subject.pop
      expect(subject.length).to eq(0)
    end

    it "removes an item from a larger array and have correct length" do
      subject.push("apple")
      subject.push("orange")
      subject.pop
      expect(subject.length).to eq(1)
    end

    it "removes an item from the back of a larger array" do
      subject.push("apple")
      subject.push("orange")
      subject.pop
      expect(subject[0]).to eq("apple")
    end

    it "removes an item and no longer returns that item" do
      subject.push("apple")
      subject.pop
      expect do
        subject[0]
      end.to raise_error("index out of bounds")
    end

    it "returns the item removed" do
      subject.push("apple")
      result = subject.pop
      expect(result).to eq("apple")
    end

    it "returns nil when array is empty" do
      result = subject.pop
      expect(result).to eq(nil)
    end

    it "does not change length when array is empty" do
      subject.pop
      expect(subject.length).to eq(0)
    end

    xit "runs faster than linear time on average" do
    end

  end

  describe "DynamicArray#shift" do

    it "removes an item and result in correct length" do
      subject.push("apple")
      subject.shift
      expect(subject.length).to eq(0)
    end

    it "removes an item from a larger array and result in correct length" do
      subject.push("apple")
      subject.push("orange")
      subject.shift
      expect(subject.length).to eq(1)
    end

    it "removes an item from the front of a larger array" do
      subject.push("apple")
      subject.push("orange")
      subject.shift
      expect(subject[0]).to eq("orange")
    end

    it "returns the item removed" do
      subject.push("apple")
      result = subject.shift
      expect(result).to eq("apple")
    end

    it "returns nil when array is empty" do
      result = subject.shift
      expect(result).to eq(nil)
    end

    it "does not change length when array is empty" do
      subject.shift
      expect(subject.length).to eq(0)
    end

    xit "runs faster than linear time on average" do
    end

  end

  describe "DynamicArray#unshift" do

    it "grows when it accepts a new item" do
      subject.unshift("apple")
      expect(subject.length).to eq(1)
    end

    it "retrieves the item that was added to it" do
      subject.unshift("apple")
      expect(subject[0]).to eq("apple")
    end

    it "returns the object on which it is called" do
      result = subject.unshift("apple")
      expect(result[0]).to eq("apple")
    end

    it "adds the item to the beginning of a larger array" do
      subject.unshift("apple")
      subject.unshift("orange")
      expect(subject[1]).to eq("apple")
    end

    xit "runs faster than linear time on average" do
    end

  end

end # of DynamicArray
