# Your code here
require "calculator"

describe Calculator do

  describe "#add" do
    it "add two numbers" do
      expect{Calculator.new.add(1, 2)}.to eq(3)
    end
  end

  describe "#substract" do
    it "substract two numbers" do
      expect{Calculator.new.substract(1, 2)}.to eq(-1)
    end
  end

  describe "#multiply" do
    it "multiply two numbers" do
      expect{Calculator.new.multiply(1, 2)}.to eq(2)
    end
  end

  describe "#divide" do
    it "divide two numbers" do
      expect{Calculator.new.divide(2, 3)}.to eq(0.6666666666666666)
    end
  end

  describe "#pow" do
    it "pow two numbers" do
      expect{Calculator.new.pow(3, 3)}.to eq(27)
    end

    it "pow two numbers" do
      expect{Calculator.new.pow(27, 1/3.0)}.to eq(3.0)
    end
  end

  describe "#sqrt" do
    it "sqrt of a number" do
      expect{Calculator.new.sqrt(9)}.to eq(3)
    end

    it "sqrt of a number" do
      expect{Calculator.new.sqrt(8)}.to eq(2.83)
    end
  end


  describe "#memory" do

    it "do not have pre memory" do
      expect{Calculator.new.memory}.to eq(nil)
    end

    it "memorize a number" do
      expect{Calculator.new.memory(8)}.to eq(8)
    end

    before {Calculator.new.memory(8)}

    it "memorize a number" do
      expect{Calculator.new.memory}.to eq(8)
    end

    before do
      Calculator.new.memory=(8)
      Calculator.new.memory
    end

    it "do not have pre memory" do
      expect{Calculator.new.memory}.to eq(nil)
    end
  end

  describe "#initilize" do
    let (:c2) {Calculator.new(true)}
    context "create new calculator with param true" do 
      it "return string instead int" do
        expect{c2.add(1,2)}.to eq("3")
      end
    end
  end


end
