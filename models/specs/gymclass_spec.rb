require("minitest/autorun")
require("minitest/rg")
require_relative("../gymclass.rb")
require_relative("../client.rb")

class GymClassTest < MiniTest::Test

  def setup()
    options = {"id" => 1, "type" => "spin", "client" => [], "instructor" => "Thomas", "capacity" => 10}
    @gymclass = GymClass.new(options)
  end

  def test_type
    result = @gymclass.type()
    assert_equal("spin",result)
  end

  def test_instructor
    result = @gymclass.instructor()
    assert_equal("Thomas",result)
  end

  def test_capacity
    result = @gymclass.capacity()
    assert_equal(10,result)
  end

  #moving to booking as a method.

  # def test_full_capacity
  #   @gymclass.capacity =+  1
  #
  #   assert_equal("Sorry We Are Full" , @gymclass.full_capacity)
  # end

end
