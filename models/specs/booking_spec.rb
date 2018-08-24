require("minitest/autorun")
require("minitest/rg")
require_relative("../booking.rb")

class BookingTest < MiniTest::Test

def setup()
options = {"id" => 1, "type" => "spin", "client" => [], "instructor" => "Thomas", }

@booking = Booking.new(options)
end

def test_type
  result = @booking.type()
  assert_equal("spin",result)
end

def test_instructor
  result = @booking.instructor()
  assert_equal("Thomas",result)
end

def test_capacity
  result = @booking.capacity()
  assert_equal(10,result)
end

def test_full_capacity
  @booking.capacity += 1
  assert_equal("Sorry We Are Full" , @booking.full_capacity)
end


end
