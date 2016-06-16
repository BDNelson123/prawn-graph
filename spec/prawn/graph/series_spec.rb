require 'spec_helper'

describe Prawn::Graph::Series do

  describe "when initialized by an array" do
    it "knows the maximum value" do
      expect(Prawn::Graph::Series.new([1,2,5,4,3]).max).to eq(5)
    end

    it "knows the minimum value" do
      expect(Prawn::Graph::Series.new([1,2,5,4,3]).min).to eq(1)
    end

    it "knows its size" do
      expect(Prawn::Graph::Series.new([1,2,5,4,3]).size).to eq(5)
    end

    it "knows its average value" do
      expect(Prawn::Graph::Series.new([1,2,5,4,3]).avg).to eq(3)
    end

    it "defaults to a bar chart" do
      expect(Prawn::Graph::Series.new([1,2,5,4,3]).type).to eq(:bar)
    end

    it "defaults to false for mark_average?" do
      expect(Prawn::Graph::Series.new([1,2,5,4,3]).mark_average?).to eq(false)
    end
    
    it "defaults to false for mark_minimum?" do
      expect(Prawn::Graph::Series.new([1,2,5,4,3]).mark_minimum?).to eq(false)
    end
    
    it "defaults to false for mark_maximum?" do
      expect(Prawn::Graph::Series.new([1,2,5,4,3]).mark_maximum?).to eq(false)
    end
    
  end

  describe "when left to its default values" do
    it "has a maximum of 0" do
      expect(Prawn::Graph::Series.new().max).to eq(0)
    end

    it "has a minimum of 0" do
      expect(Prawn::Graph::Series.new().min).to eq(0)
    end

    it "has a size of 0" do
      expect(Prawn::Graph::Series.new().size).to eq(0)
    end

    it "has an average of 0" do
      expect(Prawn::Graph::Series.new().avg).to eq(0)
    end

    it "defaults to a bar chart" do
      expect(Prawn::Graph::Series.new().type).to eq(:bar)
    end

    it "defaults to false for mark_average?" do
      expect(Prawn::Graph::Series.new().mark_average?).to eq(false)
    end
    
    it "defaults to false for mark_minimum?" do
      expect(Prawn::Graph::Series.new().mark_minimum?).to eq(false)
    end
    
    it "defaults to false for mark_maximum?" do
      expect(Prawn::Graph::Series.new().mark_maximum?).to eq(false)
    end
  end

  describe "when setting the options for rendering averages, maximum points and minimum points" do
    it "defaults to false for mark_average?" do
      expect(Prawn::Graph::Series.new().mark_average?).to eq(false)
    end
    
    it "defaults to false for mark_minimum?" do
      expect(Prawn::Graph::Series.new().mark_minimum?).to eq(false)
    end
    
    it "defaults to false for mark_maximum?" do
      expect(Prawn::Graph::Series.new().mark_maximum?).to eq(false)
    end

    it "sets the value as true for mark_average? when you specifiy the option" do
      expect(Prawn::Graph::Series.new([],{mark_average: true}).mark_average?).to eq(true)
    end
    
    it "sets the value as true for mark_minimum? when you specifiy the option" do
      expect(Prawn::Graph::Series.new([],{mark_minimum: true}).mark_minimum?).to eq(true)
    end
    
    it "sets the value as true for mark_maximum? when you specifiy the option" do
      expect(Prawn::Graph::Series.new([],{mark_maximum: true}).mark_maximum?).to eq(true)
    end
  end

  describe "When it is turning itself into an array" do
    it "correctly marshalls titles and values when both are set" do
      series = Prawn::Graph::Series.new([1,2], title: "A")
      expect(series.to_a).to eql(["A", 1, 2])
    end

    it "returns an empty array with the default values" do
      series = Prawn::Graph::Series.new()
      expect(series.to_a).to eql([])
    end

    it "returns just the values when no title is set" do
      series = Prawn::Graph::Series.new([1,2,3])
      expect(series.to_a).to eql([1,2,3])
    end
  end

end