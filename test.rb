#!/usr/bin/env ruby
load File.expand_path('../bin/shell-env', __FILE__)
require "test/unit"

class TestMe < Test::Unit::TestCase
  include ShellEnv
    
  def test_diff_env
    assert_equal({'one'=>nil}, diff_env({'one'=>'x'}, {}))
    assert_equal({'two'=>'2'}, diff_env({}, {'two'=>'2'}))
  end
    
  def test_marshal
    env = {'one'=>'1', 'two'=>'2'}
    assert_equal(env, unmarshal_env(marshal_env(env)))
  end
    
  def test_parse_env
    assert_equal({'FOO'=>'bar'}, parse_env("FOO=bar\n"))
    assert_equal({'FOO'=>'bar','BAR'=>'baz'}, parse_env("FOO=bar\nBAR=baz\n"))
    assert_equal({'FOO'=>'with space','BAR'=>'baz'}, parse_env("FOO=with space\nBAR=baz\n"))
  end
end
