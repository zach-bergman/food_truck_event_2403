class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end

    def check_stock(item)
        @inventory[item]
    end
end