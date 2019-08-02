#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

In this program, we position two buttons
in the bottom right corner of the window.
We use horizontal and vertical boxes.

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
        
        set_border_width 10
        
        vbox = Gtk::Box.new :vertical, 0
        hbox = Gtk::Box.new :horizontal, 5
        
        e_space = Gtk::Alignment.new 0, 0, 0, 0
        vbox.pack_start e_space, :expand => true
        
        ok_btn = Gtk::Button.new :label => "OK"
        ok_btn.set_size_request 70, 30
        close_btn = Gtk::Button.new :label => "Close"
        close_btn.set_size_request 70, 30
        
        hbox.add ok_btn
        hbox.add close_btn 
        
        halign = Gtk::Alignment.new 1, 0, 0, 0
        halign.add hbox
        
        vbox.pack_start halign, :expand => false, 
            :fill => false, :padding => 5

        add vbox
        
        set_title "Buttons"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end        
        
        set_default_size 260, 150
        set_window_position :center
        
        show_all        
    end
end

window = RubyApp.new
Gtk.main
