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

need{ "vector" }

module Rebirth

  # HasTransform is a mixin module for objects that have
  # @pos (position), @rot (rotation), and @scale attributes,
  # e.g. Shape and Camera.
  # 
  # It provides smart accessors and initialization for those
  # attributes.
  # 
  module HasTransform

    attr_reader :pos, :rot, :scale

    # Initializes transform attributes from values in the
    # options hash.
    # 
    # :pos::     The position of the object's center.
    #            Default: Vector[0,0].
    # 
    # :rot::     The rotation (angle) of the object, in degrees.
    #            Rotation increases counter-clockwise.
    #            Default: 0.
    # 
    # :scale::   The x and y scale factors of the object.
    #            scale < 1 shrinks, scale > 1 grows.
    #            Default: [1,1]
    # 
    def initialize( options={} )
      self.pos   = (options[:pos]   or Rebirth::Vector[0,0])
      self.rot   = (options[:rot]   or 0)
      self.scale = (options[:scale] or Rebirth::Vector[1,1])
    end


    # Sets the position to a new value.
    # 
    # new_pos::  The new position as a Vector or [x,y] Array.
    # 
    def pos=( new_pos )
      @pos = _make_vector( new_pos )
    end


    # Sets the rotation to a new value.
    # 
    # new_rot::  The new rotation, in degrees.
    # 
    def rot=( new_rot )
      @rot = new_rot.to_f
    end


    # Sets the scale to a new value.
    # 
    # new_scale  The new scale as a Vector or [x,y] Array.
    # 
    def scale=( new_scale )
      @scale = _make_vector( new_scale )
    end


    private

    # Takes a Vector or an [x,y] Array, returns a Vector.
    def _make_vector( vector_or_array )
      case vector_or_array
      when Rebirth::Vector
        vector_or_array
      else
        Rebirth::Vector[*(vector_or_array.to_ary)]
      end
    end

  end

end
