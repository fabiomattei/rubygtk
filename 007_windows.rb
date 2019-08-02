#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This is a more complicated layout example.
We use Gtk::Alignment, Gtk::Box, and Gtk::Grid widgets.

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
    
        set_border_width 15
                
        grid = Gtk::Grid.new 
        grid.set_column_spacing 5
        grid.set_row_spacing 5

        title = Gtk::Label.new "Windows"

        align1 = Gtk::Alignment.new 0, 0, 0, 0
        align1.add title
        
        grid.attach align1, 0, 0, 1, 1 
                    
        frame = Gtk::Frame.new
        frame.set_hexpand true
        frame.set_vexpand true
        grid.attach frame, 0, 1, 3, 3

        vbox = Gtk::Box.new :vertical, 4
        act_btn = Gtk::Button.new :label => "Activate"
        act_btn.set_size_request 70, 30

        close_btn = Gtk::Button.new :label => "Close"
        close_btn.set_size_request 70, 30
            
        vbox.add act_btn
        vbox.add close_btn
        grid.attach vbox, 3, 1, 1, 1
            
        help_btn = Gtk::Button.new :label => "Help"
        help_btn.set_size_request 70, 30
        align2 = Gtk::Alignment.new 0, 0, 0, 0
        align2.add help_btn        
        grid.attach align2, 0, 4, 1, 1
        
        ok_btn = Gtk::Button.new :label => "OK" 
        ok_btn.set_size_request 70, 30
        grid.attach ok_btn, 3, 4, 1, 1

        add grid
    
        set_title "Windows"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end

        set_default_size 350, 300
        set_window_position :center
        
        show_all        
    end
end

window = RubyApp.new
Gtk.main
