#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This program shows transparent rectangles.

Author: Jan Bodnar
Website: www.zetcode.com
Last modified: May 2014
'''

require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Transparent rectangles"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 590, 90
        set_window_position :center
        
        show_all
    end
    
    def init_ui
    
        @darea = Gtk::DrawingArea.new  
        
        @darea.signal_connect "draw" do  
            on_draw
        end
    
        add @darea
    end
    
    def on_draw
        
        cr = @darea.window.create_cairo_context  
        draw_rectangles cr        
    end
    
    def draw_rectangles cr
    
        for i in 1..10
            cr.set_source_rgba 0, 0, 1, i*0.1
            cr.rectangle 50*i, 20, 40, 40
            cr.fill
        end    
    end 
end

window = RubyApp.new
Gtk.main
