class Event
    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(food_truck)
        @food_trucks << food_truck
    end

    def food_truck_names
        @food_trucks.map { |food_truck| food_truck.name }
    end

    def food_trucks_that_sell(item_name)
        @food_trucks.select do |food_truck| 
            food_truck.inventory.find do |item, amount|
                item.name == item_name
            end
        end
    end

    def sorted_item_list
        @food_trucks.flat_map do |food_truck|
            food_truck.inventory.map do |item, amount|
                item.name
            end
        end.uniq.sort
    end

    # def overstocked_items
    #     item_amount = @food_trucks.map do |food_truck|
    #         food_truck.inventory.map do |item|
    #             require 'pry';binding.pry
    #             sum += amount
    #         end
    #     end
    #     require 'pry';binding.pry
    #     food_truck_count = @food_trucks.map do |food_truck|
    #         food_truck.inventory.reduce(0) do |sum, (item, amount)|
    #             sum = food_trucks_that_sell(item.name).count
    #         end
    #     end

    #     result = @food_trucks.map do |food_truck|
    #         food_truck.inventory.map.with_index do |(item, amount), i|
    #             if  food_truck_count[i] > 1 && item_amount[i] > 50
    #                 return item
    #             end
    #         end
    #     end
    #     result
    # end
end