class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end

    def check_stock(item)
        @inventory[item]
    end

    def stock(item, amount)
        @inventory[item] += amount
    end

    def potential_revenue
        @inventory.reduce(0) { |sum, (item, amount)| sum += amount * item.price }
    end
end