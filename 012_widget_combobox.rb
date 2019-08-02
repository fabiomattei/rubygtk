#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This example demonstrates the Gtk::ComboBoxText widget.

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

        fixed = Gtk::Fixed.new
        label = Gtk::Label.new '-'
        fixed.put label, 50, 140
        
        cb = Gtk::ComboBoxText.new
        cb.signal_connect "changed" do |w, e|
            on_changed w, e, label
        end

        cb.append_text 'Xubuntu'
        cb.append_text 'Mandriva'
        cb.append_text 'Redhat'
        cb.append_text 'Gentoo'
        cb.append_text 'Arch' 

        fixed.put cb, 50, 30

        add fixed
        
        set_title "Gtk::ComboBoxText"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end        

        set_default_size 300, 200
        set_window_position :center
        
        show_all        
    end

    def on_changed sender, event, label
        label.set_label sender.active_text
    end
end

window = RubyApp.new
Gtk.main
