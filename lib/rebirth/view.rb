#--
#
#  This file is one part of:
#
#  Rebirth - Game development library for Ruby
#  Copyright (C) 2008  John Croisant
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License, version 2.1, as published by the Free Software Foundation.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# 
#++


require 'rubygame'
require 'singleton'


module Rebirth

  # View represents the viewport (aka the window). 
  # This is where the game will be displayed to the player.
  # 
  # Only one View can be open at a time. See #open, #open?.
  # 
  class View

    include Singleton

    @@gl_setup = false

    # Open the View with the given size. If the View is already
    # open, it is re-opened with the new size.
    # 
    # size::     the size of the view, in pixels. (Array, required)
    # 
    # Returns::  the view (View)
    # 
    # Example::
    #    view = View.open([640,480])
    # 
    def self.open( size )
      setup_gl
      @@screen = Rubygame::Screen.new(size, 16, [Rubygame::OPENGL])
      return instance
    end

    # True if the View is already open. Otherwise, false.
    def self.open?
      Rubygame::Screen.get_surface
      true
    rescue Rubygame::SDLError
      false
    end

    # Close the view. Usually, you don't need to call this, because
    # the view will be closed automatically when the game exits.
    def self.close
      Rubygame.quit
    end

    class << self

      private

      # Setup the OpenGL attributes prior to opening the view.
      # Does nothing if they've already been set up.
      def setup_gl              # :nodoc:
        unless @@gl_setup
          Rubygame.init
          Rubygame::GL.set_attrib(Rubygame::GL::RED_SIZE,     5)
          Rubygame::GL.set_attrib(Rubygame::GL::GREEN_SIZE,   6)
          Rubygame::GL.set_attrib(Rubygame::GL::BLUE_SIZE,    5)
          Rubygame::GL.set_attrib(Rubygame::GL::DEPTH_SIZE,  16)
          Rubygame::GL.set_attrib(Rubygame::GL::DOUBLEBUFFER, 1)
          @@gl_setup = true
        end
      end
    end

  end

end
