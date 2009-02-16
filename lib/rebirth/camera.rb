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


class Rebirth::Camera

  attr_reader :pos, :rot, :scale, :viewport

  @@active_camera = nil


  def self.active_camera
    @@active_camera
  end

  def self.clear_active_camera
    @@active_camera = nil
  end


  def initialize( options={} )
    @pos     = (options[:pos]   or [0,0])
    @rot     = (options[:rot]   or 0)
    @scale   = (options[:scale] or [1,1])
    @viewport = (options[:viewport] or reset_from_view)
  end


  def make_active
    @@active_camera = self
  end

  def reset_from_view
    if Rebirth::View.open?
      @viewport = [0,0] + Rebirth::View.size
    else
      @viewport = [0,0,0,0]
    end
  end

end
