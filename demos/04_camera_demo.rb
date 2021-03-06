#!/usr/bin/env ruby

#
#
#  DEMO: Camera
#
#  DESC: Displays a solid white box. Quits when Q key pressed.
#
#  DATE: 2009-02-16
#
#
#--
#
#  This file is one part of:
#
#  Rebirth - Game development library for Ruby
#  Copyright (C) 2008, 2009  John Croisant
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

# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth
include Rubygame::EventTriggers
include Rubygame::EventActions


View.open([640,480])

evm = EventManager.instance
evm.make_magic_hooks( :q => Proc.new { throw :quit } )

puts "Press Q to exit."


# Create Camera and register to receive DrawEvents
camera = Camera.new( :pos   => [320,240],
                     :rot   => 0,
                     :scale => [1,1],
                     # viewport deliberately off-center
                     :viewport => [30, 30, 600, 440],
                     :bgcolor => [0.2, 0, 0.2, 1])
evm.make_magic_hooks_for( camera, { DrawEvent => :pre_draw } )


# Create Box and register to receive DrawEvents
box = Box.new( :pos   => [320,240],
               :rot   => 15,
               :scale => [128,64] )
evm.make_magic_hooks_for( box, { DrawEvent => :draw } )


# Another hook, this time for after everything is drawn
evm.make_magic_hooks_for( camera, { DrawEvent => :post_draw } )


draw_event = DrawEvent.new

catch :quit do
  loop do
    evm.push( draw_event )
    evm.update
  end
end
