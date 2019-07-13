# frozen_string_literal: true

require 'xkbcommon'

class XkbHelper
  def initialize
    @keymap = Xkbcommon::Context.new.keymap_from_names(rules: 'evdev', model: 'pc104', layout: 'us')
    @keys = @keymap.keys
    @modifiers = @keymap.modifiers
    @symbols = @keymap.symbols
    @characters = @keymap.characters
    @scancodes = {}

    # Convert into a mapping table by keycode.  This may be imperfect,
    # but will work for our purposes.
    @symbols.each do |name, symbol|
      scancodes = symbol.keys.map(&:code)
      scancodes = scancodes.sort(&:<=>)
      @scancodes[scancodes.join(":")] = name
    end
  end

  def keycode_to_symbol *args
    @scancodes[args.sort(&:<=>).map(&:to_s).join(":")]
  end
end
