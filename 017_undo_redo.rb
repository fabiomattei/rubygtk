#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This example shows how to 
activate/deactivate a Gtk::ToolButton.

Author: Jan Bodnar
Website: www.zetcode.com
Last modified: May 2014
'''

require 'gtk3'


class RubyApp < Gtk::Window
    
    def initialize
        super
    
        @count = 2
        
        init_ui
    end
    
    def init_ui
    
        toolbar = Gtk::Toolbar.new
        toolbar.set_toolbar_style Gtk::Toolbar::Style::ICONS

        @undo = Gtk::ToolButton.new :stock_id => Gtk::Stock::UNDO
        @redo = Gtk::ToolButton.new :stock_id => Gtk::Stock::REDO
        sep = Gtk::SeparatorToolItem.new
        quit = Gtk::ToolButton.new :stock_id => Gtk::Stock::QUIT

        toolbar.insert @undo, 0
        toolbar.insert @redo, 1
        toolbar.insert sep, 2
        toolbar.insert quit, 3
        
        @undo.signal_connect "clicked" do
            on_undo
        end
         
        @redo.signal_connect "clicked" do
            on_redo
        end
        
        quit.signal_connect "clicked" do
            Gtk.main_quit
        end

        vbox = Gtk::Box.new :vertical, 2
        vbox.pack_start toolbar, :expand => false, 
            :fill => false, :padding => 0

        self.add vbox
        

        set_default_size 300, 200
        set_window_position :center
        
        show_all        
        
        set_title "Undo redo"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end
    end
    
    def on_undo

        @count = @count - 1

        if @count <= 0
            @undo.set_sensitive false
            @redo.set_sensitive true
        end
    end


    def on_redo
        @count = @count + 1

        if @count >= 5
            @redo.set_sensitive false
            @undo.set_sensitive true
        end
    end
end

window = RubyApp.new
Gtk.main
