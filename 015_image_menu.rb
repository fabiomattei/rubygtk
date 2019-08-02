#!/usr/bin/ruby

'''
ZetCode Ruby GTK tutorial

This example shows a menu with
images, accelerators and a separator.

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
    
        override_background_color :normal, 
            Gdk::RGBA.new(0.2, 0.2, 0.2, 1)
        mb = Gtk::MenuBar.new

        filemenu = Gtk::Menu.new
        filem = Gtk::MenuItem.new "File"
        filem.set_submenu filemenu
        
        agr = Gtk::AccelGroup.new
        add_accel_group agr

        newi = Gtk::ImageMenuItem.new :stock_id => Gtk::Stock::NEW, 
            :accel_group => agr
        key, mod = Gtk::Accelerator.parse "N"

        newi.add_accelerator "activate", agr, key,
           mod, Gtk::AccelFlags::VISIBLE
        filemenu.append newi

        openm = Gtk::ImageMenuItem.new :stock_id => Gtk::Stock::OPEN, 
            :accel_group => agr
        key, mod = Gtk::Accelerator.parse "O"
        openm.add_accelerator "activate", agr, key, 
            mod, Gtk::AccelFlags::VISIBLE
        filemenu.append openm

        sep = Gtk::SeparatorMenuItem.new
        filemenu.append sep

        exit = Gtk::ImageMenuItem.new :stock_id => Gtk::Stock::QUIT, 
            :accel_group => agr
        key, mod = Gtk::Accelerator.parse "Q"
        
        exit.add_accelerator "activate", agr, key, 
            mod, :visible

        exit.signal_connect "activate" do
            Gtk.main_quit
        end
        filemenu.append exit

        mb.append filem

        vbox = Gtk::Box.new :vertical, 2
        vbox.pack_start mb, :expand => false, :fill => false, 
            :padding => 0

        add vbox
        
        set_title "Image menu"
        signal_connect "destroy" do 
            Gtk.main_quit 
        end        
        
        set_default_size 300, 200
        set_window_position :center
        show_all        
    end
end

window = RubyApp.new
Gtk.main
