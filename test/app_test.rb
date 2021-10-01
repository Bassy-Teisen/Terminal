require 'test/unit'
# require_relative '../index'
# require_relative '../app'
require_relative '../app'

class AppTest < Test::Unit::TestCase
    def test_create
        app = App.new('blah', 'blahs')
    end
    def test_first_name
    app = App.new('blah', 'blahs')
    assert_equal('blah', app.first_name) 
    end 
end 