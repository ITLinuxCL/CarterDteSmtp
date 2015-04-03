require "carter_dte_smtp"

require 'minitest/autorun'
require 'minitest/reporters' # requires the gem

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new # spec-like progress

# Only log Celluloid errors
Celluloid.logger.level = Logger::ERROR

class ReturnSmtpServer
    include Celluloid::IO
    finalizer :shutdown
    
    attr_accessor :result

    def initialize()
      @server = TCPServer.new("localhost", 10025)
      @result = false
      @timer = after(5) { shutdown }
      async.run
    end

    def shutdown
      @server.close if @server
    end

    def run
      loop { async.handle_connection @server.accept }
    end

    def handle_connection(socket)
      if socket.peeraddr
        self.result = true
        #shutdown
      end
    rescue EOFError
      puts "*** #{host}:#{port} disconnected"
      socket.close
    end
end

class Mailer
  include Celluloid
  
  def initialize
    @mail = message
  end
  
  def send
    @mail.deliver!
  end
  
  def message
    smtp_conn = smtp_options
    Mail.defaults do
      delivery_method :smtp_connection, { :connection => smtp_conn.start }
    end
    Mail.new do
       from     'me@test.lindsaar.net'
       to       'you@test.lindsaar.net'
       subject  'Here is the image you wanted'
       body     "Body"
       #add_file :filename => 'somefile.png', :content => File.read('/somefile.png')
     end
  end
  
  def smtp_options
    smtp = Net::SMTP.new("localhost", 10024)
    smtp.read_timeout = 2
    smtp.open_timeout = 2
    smtp
  end
  
end