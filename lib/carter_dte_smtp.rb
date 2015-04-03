require 'celluloid/io'
require 'celluloid/autostart'
require 'yaml'
require 'carter_dte_smtp/connection'
require 'carter_dte_smtp/protocol'
require 'carter_dte_smtp/server'
require 'carter_dte_smtp/cli'
require 'carter_dte_smtp/config'
require 'mail'

$:.unshift File.expand_path('../', __FILE__)
Celluloid.logger.level = Logger::ERROR

module CarterDteSmtp

  extend self

  def host
    CarterDteSmtp::Config::bind_address || '127.0.0.1'
  end

  def port
    CarterDteSmtp::Config::bind_port || 10024
  end

  def start!( server )
    server.start! host, port
  end
  
  def server_name
    "#{hostname} - CarterDte SMTP Server"
  end
  
  def hostname
    `hostname`.chomp
  end

end