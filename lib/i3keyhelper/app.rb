require 'xlib-objects'
require 'json'

module I3KeyHelper
  class App

    def initialize
      puts "In initialize"
      @options = AppOptions.new
      @xi_helper = XInputHelper.new ':0'
      @xkb_helper = XkbHelper.new
    end

    def setup
      # Register our event handler for events.
      @xi_helper.top_level_windows.each do |window|
        %i(xi_key_press xi_key_release xi_focus_in xi_focus_out).each do |name, _|
          window.on(name, name, &method(:handle_event))
        end
      end
    end

    def handle_event(event)
      keysym = @xkb_helper.keycode_to_symbol(event.detail)
      puts "#{event.event}: #{XlibObj::Extension::XI::Event::TYPES.key(event.evtype)}, device #{event.deviceid}, source #{event.sourceid}, keysym #{keysym}"
    end

    def run
      done = false
      until done
        Kernel.select([@xi_helper.display.socket])
        @xi_helper.display.handle_events
      end
    end

    def get_keyboard_mappings

    end

    def start
      setup
      run
    end
  end
end

