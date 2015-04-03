require 'test_helper'

class TestCli < Minitest::Test
  
  def setup
    @cli = CarterDteSmtp::CLI.new()
  end
  
  def test_return_info_if_not_config_file
    assert_raises(Thor::RequiredArgumentMissingError) { @cli.invoke("start_server") }
  end

  
end