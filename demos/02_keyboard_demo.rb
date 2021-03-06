#!/usr/bin/env ruby

#
#
#  DEMO: Keyboard events
#
#  DESC: Empty view, nothing displayed. Quits when Q key pressed.
#
#  DATE: 2008-06-08
#
#
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

# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth
include Rubygame::EventTriggers
include Rubygame::EventActions

View.open([640,480])

evm = EventManager.instance
evm.make_magic_hooks(:q => Proc.new { throw :quit } )

puts "Press Q to exit."

catch :quit do
  loop do
    evm.update
  end
end
