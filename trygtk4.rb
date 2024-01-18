#!/usr/bin/env ruby

require 'gtk4'

app = Gtk::Application.new 'com.iridakos.gtk-todo', :flags_none

app.signal_connect :activate do |application|
  window = Gtk::ApplicationWindow.new(application)
  window.set_title 'Hello GTK+Ruby!'
  window.present
end

puts app.run
