# exercise3.rb

# Write the required classes given this test suite:

require 'minitest/autorun'

class Transport
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    self.class == other.class && name == other.name
  end
end

class Car < Transport; end

class Bike < Transport; end

# tests

class TransportTest < Minitest::Test
  def test_name1
    car1 = Car.new("Gazelle")
    bike1 = Bike.new("Gazelle")
    assert_equal(false, car1 == bike1)
  end

  def test_name2
    car1 = Car.new("Gazelle")
    car2 = Car.new("Gazelle")
    assert_equal(true, car1 == car2)
  end

  def test_name3
    car1 = Car.new("Gazele")
    car2 = Car.new("Gazelle")
    assert_equal(false, car1 == car2)
  end
end
