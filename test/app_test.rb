require 'test/unit'
# require_relative '../index'
# require_relative '../app'
# require_relative '../app'
require_relative '../name_reciver.rb'


class AppTest < Test::Unit::TestCase
    def test_play_again_yes
        app = play_again("y")
        assert_equal(true, app)
    end
    def test_play_again_no
        app = play_again("n")
        assert_equal(false, app)
    end
    def test_check_answer_correct
        app = check_answer?(1, 1)
        assert_equal(true, app)
    end
    def test_check_answer_wrong
        app = check_answer?(1, 2)
        assert_equal(false, app)
    end 
end