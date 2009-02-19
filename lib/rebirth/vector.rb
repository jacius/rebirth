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

module Rebirth

  # The Vector class implements two-dimensional vectors.
  # It is used to represent positions, movements, and velocities
  # in 2D space.
  # 
  class Vector

    attr_reader :x, :y

    class << self

      alias :[] :new


      # Create a new Vector from an angle in radians and a
      # magnitude. Use #new_dam for degrees.
      def new_am( angle_rad, magnitude )
        self.new( Math::cos(angle_rad)*magnitude,
                  Math::sin(angle_rad)*magnitude )
      end

    end


    # Create a new Vector with the given x and y values.
    def initialize( x, y )
      @x, @y = x.to_f, y.to_f
    end

  end

end
