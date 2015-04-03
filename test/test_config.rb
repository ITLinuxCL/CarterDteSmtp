require 'test_helper'

class TestConfig < Minitest::Test
  
  def test_should_raise_not_file_if_file_not_exists
    assert_raises(Errno::ENOENT) { CarterDteSmtp::Config.parse("/tmp/file") }
  end
  
  def test_should_return_config_values
    CarterDteSmtp::Config.parse("./test/fixtures/config.yml")
    assert_equal("127.0.0.1", CarterDteSmtp::Config::bind_address)
    assert_equal("127.0.0.1", CarterDteSmtp::Config::return_host)
    assert_equal("30025", CarterDteSmtp::Config::return_port)
  end
  
end