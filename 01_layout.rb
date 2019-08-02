#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This program centers a window on 
the screen.

Author: Jan Bodnar
Website: www.zetcode.com
Last modified: May 2014
'''

require 'gtk3'

class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Center"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end

        set_default_size 300, 200

        set_window_position Gtk::WindowPosition::CENTER
        
        show
    end
end

window = RubyApp.new
Gtk.main
