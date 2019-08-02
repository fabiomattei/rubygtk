#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

In this program, we lay out widgets
using absolute positioning.

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

        override_background_color :normal, Gdk::RGBA::new(0.2, 0.2, 0.2, 1)
               
        begin       
            bardejov = GdkPixbuf::Pixbuf.new :file => "ruby.jpg"
            rotunda = GdkPixbuf::Pixbuf.new :file => "ruby2.jpg"
            mincol = GdkPixbuf::Pixbuf.new :file => "ruby3.jpg"
        rescue IOError => e
            puts e
            puts "cannot load images"
            exit
        end

        image1 = Gtk::Image.new :pixbuf => bardejov 
        image2 = Gtk::Image.new :pixbuf => rotunda 
        image3 = Gtk::Image.new :pixbuf => mincol 
        
        fixed = Gtk::Fixed.new
        
        fixed.put image1, 20, 20
        fixed.put image2, 40, 160
        fixed.put image3, 170, 50
  
        add fixed
        
        set_title "Fixed"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end        
        
        set_default_size 300, 280
        window_position = :center
        
        show_all        
    end
end

window = RubyApp.new
Gtk.main
