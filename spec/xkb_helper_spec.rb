# frozen_string_literal: true

require 'rspec'
require 'i3keyhelper/xkb_helper'

describe 'xkb_helper' do

  after do
    # Do nothing
  end

  describe XkbHelper do
    it 'initializes correctly' do
      xkb_helper = XkbHelper.new

      expect(xkb_helper).to be_an_instance_of(XkbHelper)
    end

    it 'properly maps keycodes to symbols' do
      xkb_helper = XkbHelper.new

      expect(xkb_helper.keycode_to_symbol(65)).to eq(:space)
      expect(xkb_helper.keycode_to_symbol(50)).to eq(:Shift_L)
      expect(xkb_helper.keycode_to_symbol(64)).to eq(:Alt_L)
      expect(xkb_helper.keycode_to_symbol(50, 61)).to eq(:question)
    end
  end
end
