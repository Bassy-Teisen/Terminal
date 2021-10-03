require 'test/unit'
require_relative '../name_reciver.rb'

class AppTest < Test::Unit::TestCase
    # This test checks if the play_again() is giving a 'true' respone to the user replying with a 'y'
  def test_play_again_yes
    app = play_again('y')
    assert_equal(true, app)
  end
    # This test checks if the play_again() is giving a 'false' respone to the user replying with a 'n'
  def test_play_again_no
    app = play_again('n')
    assert_equal(false, app)
  end
    # This test checks if the check_answer_correct() is valdating the two values to be equal and returns true
  def test_check_answer_correct
    app = check_answer?(1, 1)
    assert_equal(true, app)
  end
    # This test checks if the check_answer_correct() is valdating the two values to be unequal and returns false
  def test_check_answer_wrong
    app = check_answer?(1, 2)
    assert_equal(false, app)
  end
end
