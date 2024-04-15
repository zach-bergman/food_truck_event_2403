require "spec_helper"

RSpec.describe FoodTruck do
    before(:each) do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    end

    describe "#initialize" do
        it "exists" do
            expect(@food_truck).to be_an_instance_of(FoodTruck)
        end

        it "has a name" do
            expect(@food_truck.name).to eq("Rocky Mountain Pies")
        end

        it "has an inventory" do
            expect(@food_truck.inventory).to eq({})
        end
    end

    describe "#check_stock" do
        it "returns the amount of a given item in the inventory" do
            expect(@food_truck.check_stock(@item1)).to eq(0)
        end
    end

    describe "#stock" do
        it "adds an item and amount to the inventory" do
            expect(@food_truck.inventory).to eq({})

            @food_truck.stock(@item1, 30)

            expect(@food_truck.inventory).to eq({@item1 => 30})

            expect(@food_truck.check_stock(@item1)).to eq(30)

            @food_truck.stock(@item1, 25)

            expect(@food_truck.check_stock(@item1)).to eq(55)

            @food_truck.stock(@item2, 12)
            
            expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
        end
    end
end