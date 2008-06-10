#!/usr/bin/env ruby

#
#
#  DEMO: View
#
#  DESC: Empty view, nothing displayed. Quits after 10 seconds.
#
#  DATE: 2008-06-07
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

View.open([640,480])

sleep 10
