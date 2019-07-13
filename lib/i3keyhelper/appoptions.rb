require 'optparse'

class AppOptions

  attr_accessor :display

  def initialize
    @display = ':0'
  end

  def self.parse_arguments
    OptionParser.new do |opts|
      opts.banner = "Usage: stuff"

      opts.on('--display DISPLAY', "Display to connect to.") do |display|
        @display = display
      end
    end
  end
end
