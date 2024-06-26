require "spec_helper"

RSpec.describe Event do
    before(:each) do
        @event = Event.new("South Pearl Street Farmers Market")  
        
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"}) 

        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck1.stock(@item1, 35)  
        @food_truck1.stock(@item2, 7)  

        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)

        @food_truck3 = FoodTruck.new("Palisade Peach Shack") 
        @food_truck3.stock(@item1, 65)
    end

    describe "#initialize" do
        it "exists" do
            expect(@event).to be_an_instance_of(Event)
        end

        it "has a name" do
            expect(@event.name).to eq("South Pearl Street Farmers Market")
        end

        it "has a list of food trucks" do
            expect(@event.food_trucks).to eq([])
        end
    end

    describe "#add_food_truck" do
        it "adds a food truck to the list of food trucks" do
            expect(@event.food_trucks).to eq([])

            @event.add_food_truck(@food_truck1)  
            @event.add_food_truck(@food_truck2)   
            @event.add_food_truck(@food_truck3)

            expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
        end
    end

    describe "#food_truck_names" do
        it "returns a list of food truck names" do
            @event.add_food_truck(@food_truck1)  
            @event.add_food_truck(@food_truck2)   
            @event.add_food_truck(@food_truck3)

            expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
        end
    end

    describe "#food_trucks_that_sell" do
        it "returns a list of food trucks that sell specified item" do
            @event.add_food_truck(@food_truck1)  
            @event.add_food_truck(@food_truck2)   
            @event.add_food_truck(@food_truck3)

            expect(@event.food_trucks_that_sell('Peach Pie (Slice)')).to eq([@food_truck1, @food_truck3])
            expect(@event.food_trucks_that_sell("Banana Nice Cream")).to eq([@food_truck2])
        end
    end

    describe "#sorted_item_list" do
        it "returns an alphabetical list of all item names that are sold by food trucks" do
            @event.add_food_truck(@food_truck1)  
            @event.add_food_truck(@food_truck2)   
            @event.add_food_truck(@food_truck3)

            expected = ["Apple Pie (Slice)", "Banana Nice Cream", 'Peach Pie (Slice)', "Peach-Raspberry Nice Cream"]

            expect(@event.sorted_item_list).to eq(expected)
        end
    end

    describe "#total_inventory" do
        it "returns a Hash with details on each item" do
            @event.add_food_truck(@food_truck1)  
            @event.add_food_truck(@food_truck2)   
            @event.add_food_truck(@food_truck3)

            expected = {
                @item1 => {
                    quantity: 100,
                    food_trucks: [@food_truck1, @food_truck3]
                },

                @item2 => {
                    quantity: 7,
                    food_trucks: [@food_truck1]
                },

                @item3 => {
                    quantity: 25,
                    food_trucks: [@food_truck2]
                },

                @item4 => {
                    quantity: 50,
                    food_trucks: [@food_truck2]
                }
            }

            expect(@event.total_inventory).to eq(expected)
        end
    end

    # describe "#overstocked_items" do
    #     it "returns a list of items that are overstocked" do
    #         @event.add_food_truck(@food_truck1)  
    #         @event.add_food_truck(@food_truck2)   
    #         @event.add_food_truck(@food_truck3)

    #         expect(@event.food_trucks_that_sell('Peach Pie (Slice)')).to eq([@food_truck1, @food_truck3])

    #         expect(@food_truck1.inventory[@item1]).to eq(35)
    #         expect(@food_truck3.inventory[@item1]).to eq(65)

    #         expect(@event.overstocked_items).to eq([@item1])
    #     end
    # end
end