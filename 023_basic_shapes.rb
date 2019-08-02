#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This code example draws basic shapes.

Author: Jan Bodnar
Website: www.zetcode.com
Last modified: May 2014
'''

require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Basic shapes"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 390, 240
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
        draw_shapes cr
    end
    
    def draw_shapes cr
    
        cr.set_source_rgb 0.6, 0.6, 0.6

        cr.rectangle 20, 20, 120, 80
        cr.rectangle 180, 20, 80, 80
        cr.fill

        cr.arc 330, 60, 40, 0, 2*Math::PI
        cr.fill
        
        cr.arc 90, 160, 40, Math::PI/4, Math::PI
        cr.fill

        cr.translate 220, 180
        cr.scale 1, 0.7
        cr.arc 0, 0, 50, 0, 2*Math::PI
        cr.fill
    end
end

window = RubyApp.new
Gtk.main
