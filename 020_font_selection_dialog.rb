#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This example presents the Gtk::FontSelectionDialog.

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
        button = Gtk::Button.new :label => "Select font"
        
        button.signal_connect "clicked" do
            on_clicked
        end

        fix = Gtk::Fixed.new
        fix.put button, 100, 30
        fix.put @label, 30, 90
        add fix
        
        set_title "Gtk::FontSelectionDialog"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end        
        
        set_default_size 300, 150
        set_window_position :center
        
        show_all        
    end
    
    def on_clicked

        fdia = Gtk::FontChooserDialog.new :title => "Select font name", 
            :parent => nil
        response = fdia.run
                      
        if response == Gtk::ResponseType::OK
 
            font_desc = Pango::FontDescription.new fdia.font_desc
            if font_desc

                @label.override_font font_desc
            end
        end
        
        fdia.destroy
    end     
end

window = RubyApp.new
Gtk.main

