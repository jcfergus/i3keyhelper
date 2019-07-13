# frozen_string_literal: true

require 'xlib-objects'

class XInputHelper
 def initialize(display)
  @display = XlibObj::Display.new ':0'
  @root_window = @display.screens.first.root_window
  @top_level_windows = root_window.property(:_NET_CLIENT_LIST_STACKING)
  @keyboards = @display.keyboards
 end

 attr_accessor :display
 attr_accessor :options
 attr_accessor :root_window
 attr_accessor :top_level_windows

 def get_current_keyboard
 end
end
