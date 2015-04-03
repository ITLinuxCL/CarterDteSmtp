module CarterDteSmtp

  require 'thor'
  class CLI < Thor
    option :config, :required => true
    desc "start_server", "Start the SMTP CarterDTE Filter Server"
    def start_server
      CarterDteSmtp::Config.parse options[:config]
      CarterDteSmtp.start! CarterDteSmtp::Celluloid::Server
    end
    
    default_task :start_server
    
  end

end