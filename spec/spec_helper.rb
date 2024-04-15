require 'simplecov'

SimpleCov.start

RSpec.configure do |config|
    config.formatter = :documentation
end

require 'pry'

require "./lib/item"
require "./lib/food_truck"