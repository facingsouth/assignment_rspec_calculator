# Your code here
require "calculator"

describe Calculator do

  describe "#add" do
    it "add two numbers" do
      expect(Calculator.new.add(1, 2)).to eq(3)
    end

    it "add two numbers" do
      expect(Calculator.new.add(-1, 2)).to eq(1)
    end

    it "add two numbers" do
      expect(Calculator.new.add(1.0, 2.0)).to eq(3.0)
    end

  end

  describe "#subtract" do
    it "substract two numbers" do
      expect(Calculator.new.subtract(1, 2)).to eq(-1)
    end

    it "substract two numbers" do
      expect(Calculator.new.subtract(-1, 2)).to eq(-3)
    end

    it "substract two numbers" do
      expect(Calculator.new.subtract(4.0, 2.0)).to eq(2.0)
    end
  end

  describe "#multiply" do
    it "multiply two numbers" do
      expect(Calculator.new.multiply(1, 2)).to eq(2)
    end
  end

  describe "#divide" do
    it "divide two numbers" do
      expect(Calculator.new.divide(2, 3)).to eq(0.6666666666666666)
    end

    it "divide two numbers" do
      expect(Calculator.new.divide(4, 2)).to eq(2)
    end

    it "divide two numbers" do
      expect{Calculator.new.divide(2, 0)}.to raise_error(ArgumentError)
    end
  end

  describe "#pow" do
    it "pow two numbers" do
      expect(Calculator.new.pow(3, 3)).to eq(27)
    end

    it "pow two numbers" do
      expect(Calculator.new.pow(3, -3)).to eq(1/27.0)
    end

    it "pow two numbers" do
      expect(Calculator.new.pow(27, 1/3.0)).to eq(3.0)
    end
  end

  describe "#sqrt" do
    it "sqrt of a number" do
      expect(Calculator.new.sqrt(9)).to eq(3)
    end

    it "sqrt of a number" do
      expect{Calculator.new.sqrt(-9)}.to raise_error(ArgumentError)
    end

    it "sqrt of a number" do
      expect(Calculator.new.sqrt(8)).to eq(2.83)
    end
  end


  describe "#memory" do
   let(:c){Calculator.new}
    it "do not have pre memory" do
      expect(Calculator.new.memory).to eq(nil)
    end


    it "memorize a number" do
      c.memory = 8
      expect(c.memory).to eq(8)
    end

    it "do not have pre memory" do
      c.memory = 8
      c.memory
      expect(Calculator.new.memory).to eq(nil)
    end
  end

  describe "#initialize" do
    let (:c2) {Calculator.new(true)}
    context "create new calculator with param true" do 
      it "return string instead int" do
        expect(c2.add(1,2)).to eq("3")
      end 
    end
  end


end
