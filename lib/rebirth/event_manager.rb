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
require 'rebirth/event_handler'


module Rebirth


  # EventManager is the central event coordinator.
  # It fetches events from Rubygame, and provides
  # EventHandler functionality to allow other objects
  # to register event hooks to "distribute" the events.
  # 
  # EventManager is a singleton; there can be only one per
  # app. Use EventManager.instance to get the instance.
  # 
  class EventManager

    include Singleton

    include Rebirth::HasEventHandler
    private :handle


    def initialize
      @_queue = Rubygame::EventQueue.new
      @_queue.enable_new_style_events
    end


    # Handle all events in the queue.
    def update
      @_queue.each { |event|
        handle( event )
      }
    end


    # Append one or more events to the queue.
    def push( *events )
      @_queue.push( *events )
    end

  end

end
