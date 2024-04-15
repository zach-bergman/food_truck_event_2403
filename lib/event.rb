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
end