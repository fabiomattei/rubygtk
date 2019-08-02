#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This example demonstrates the Gtk::Label widget.

Author: Jan Bodnar
Website: www.zetcode.com
Last modified: May 2014
'''


require 'gtk3'

$lyrics = %{Meet you downstairs in the bar and heard
your rolled up sleeves and your skull t-shirt
You say why did you do it with him today?
and sniff me out like I was Tanqueray

cause you're my fella, my guy
hand me your stella and fly
by the time I'm out the door
you tear men down like Roger Moore

I cheated myself
like I knew I would
I told ya, I was trouble
you know that I'm no good}


class RubyApp < Gtk::Window

    def initialize
        super
        
        init_ui
    end
    
    def init_ui
    
        set_title  "You know I'm no Good"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
    
        set_border_width 10
        label = Gtk::Label.new $lyrics
        add label    
        
        set_default_size 250, 200
        set_window_position :center
        
        show_all        
    
    end
end

window = RubyApp.new
Gtk.main
