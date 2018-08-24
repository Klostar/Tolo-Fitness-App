require("minitest/autorun")
require("minitest/rg")
require_relative("../pt.rb")

class PtTest < MiniTest::Test

def setup()
options = { "id" => 1,
            "name" => "thomas",
            "specialty" => "bootcamp" }


  @pt = Pt.new( options )
end

def test_specialty
result = @pt.specialty
assert_equal("bootcamp", result)
end

def test_name
  result = @pt.name
assert_equal("thomas",result)
end

end
