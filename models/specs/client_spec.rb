require("minitest/autorun")
require("minitest/rg")
require_relative("../client.rb")

class ClientTest < MiniTest::Test

def setup()
  options = { 'id' => 1, 'first_name' => 'Ash', 'last_name' => 'Riley', 'age' => 32 }

  @client = Client.new(options)
end

def test_first_name
  result = @client.first_name
  assert_equal("Ash",result)
end

def test_last_name
  result = @client.last_name
  assert_equal("Riley",result)
end

def test_full_name
result = @client.full_name
assert_equal("Ash Riley",result)
end

def test_age
  result = @client.age
  assert_equal(32,result)
end

end
