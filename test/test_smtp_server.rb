require 'test_helper'

class TestSmtpServer < Minitest::Test
  
  def setup
    @server = CarterDteSmtp::Celluloid::Server.new "localhost", 10024
    @mail = Mailer.new
  end
  
  def test_should_accept_mail
    assert(@mail.send, "Failure message.")
  end
  
  # def test_should_resend_the_email_to_the_specified_host_and_port
  #   server_tmp = ReturnSmtpServer.new
  #   # s = TCPSocket.new 'localhost', 10025
  #   # s.close
  #   assert(server_tmp.result, "Failure message.")
  # end

end