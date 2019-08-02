#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This program toggles the title of the
window with the Gtk::CheckButton widget.

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
    
        fixed = Gtk::Fixed.new
        add fixed
        
        cb = Gtk::CheckButton.new "Show title"
        cb.set_active true
        cb.set_can_focus false
        cb.signal_connect("clicked") do |w|
            on_clicked w
        end

        fixed.put cb, 50, 50    
        
        set_title "Gkt::CheckButton"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end        

        set_default_size 300, 200
        set_window_position :center
        show_all        
    
    end
    
    def on_clicked sender

        if sender.active?
            self.set_title "Gtk::CheckButton"
        else
           self.set_title ""
        end
    end
end

window = RubyApp.new
Gtk.main
