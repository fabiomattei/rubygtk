#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This example demonstrates the Gtk::Image widget.

Author: Jan Bodnar
Website: www.zetcode.com
Last modified: May 2014
'''

require 'gtk3'

class RubyApp < Gtk::Window

    def initialize
        super
        
        init_ui
    end
    
    def init_ui
    
        set_border_width 2
        
        image = Gtk::Image.new :file => "redrock.png"
        add image
        
        set_title "Red Rock"
        signal_connect "destroy" do 
            Gtk.main_quit
        end
            
        set_window_position :center
        
        show_all            
    end
    
end

window = RubyApp.new
Gtk.main
