#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This is a simple Nibbles game
clone.

Author: Jan Bodnar
Website: www.zetcode.com
Last modified: May 2014
'''

require 'gtk3'
require './028_board'

class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Nibbles"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        @board = Board.new
        signal_connect "key-press-event" do |w, e|
            on_key_down w, e
        end
        
        add @board

        set_default_size WIDTH, HEIGHT
        set_window_position :center
        show_all
    end
    
    def on_key_down widget, event 
     
        key = event.keyval
        @board.on_key_down event
    end
end

window = RubyApp.new
Gtk.main
