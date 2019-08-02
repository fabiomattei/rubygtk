#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This program draws text.

Author: Jan Bodnar
Website: www.zetcode.com
Last modified: May 2014
'''

require 'gtk3'


class RubyApp < Gtk::Window

    def initialize
        super
    
        set_title "Soulmate"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui

        set_default_size 370, 240
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
        draw_lyrics cr
    end
    
    def draw_lyrics cr
    
        cr.set_source_rgb 0.1, 0.1, 0.1
         
        cr.select_font_face "Purisa", Cairo::FONT_SLANT_NORMAL, 
            Cairo::FONT_WEIGHT_NORMAL
        cr.set_font_size 13 
       
        cr.move_to 20, 30
        cr.show_text "Most relationships seem so transitory"
        cr.move_to 20, 60
        cr.show_text "They're all good but not the permanent one"
        cr.move_to 20, 120
        cr.show_text "Who doesn't long for someone to hold"
        cr.move_to 20, 150
        cr.show_text "Who knows how to love without being told"
        cr.move_to 20, 180
        cr.show_text "Somebody tell me why I'm on my own"
        cr.move_to 20, 210
        cr.show_text "If there's a soulmate for everyone"
    end
end

window = RubyApp.new
Gtk.main
