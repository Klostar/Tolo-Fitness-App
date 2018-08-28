require("minitest/autorun")
require("minitest/rg")
require_relative("../trainer.rb")

class TrainerTest < MiniTest::Test

  def setup()
    options = { 'id' => 1, 'name' => 'alex', 'specialty' => 'kettlebells'}
    @trainer = Trainer.new(options)
  end

  def test_name
    result = @trainer.name
    assert_equal("alex",result)
  end

    def test_specialty
      result = @trainer.specialty
      assert_equal('kettlebells',result)
    end

end
