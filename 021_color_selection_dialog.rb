#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This example presents the Gtk::ColorSelectionDialog.

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
        @label = Gtk::Label.new "The only victory over love is flight."
        button = Gtk::Button.new :label => "Select colour"
        
        button.signal_connect "clicked" do
            on_clicked
        end

        fix = Gtk::Fixed.new
        fix.put button, 100, 30
        fix.put @label, 30, 90
        add fix
        
        set_title "Gtk::ColorSelectionDialog"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end        

        set_default_size 350, 150
        set_window_position :center
        
        show_all        
    end
    
    def on_clicked

        cdia = Gtk::ColorSelectionDialog.new :title => "Select colour"
        response = cdia.run
              
        if response == Gtk::ResponseType::OK
        
            colorsel = cdia.color_selection
            col = colorsel.current_rgba
            @label.override_color :normal, col
        end
        
        cdia.destroy
    end
end

window = RubyApp.new
Gtk.main
