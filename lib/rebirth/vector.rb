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


      # Create a new Vector from an angle in degrees and a
      # magnitude. Use #new_am for radians.
      def new_dam( angle_deg, magnitude )
        self.new_am( angle_deg.to_rad, magnitude )
      end


      # call-seq:
      #   Vector.many( [x1,y1], [x2,y2], ... )
      # 
      # Convert multiple [x,y] Arrays to Vectors.
      # Returns the resulting vectors in an Array.
      # 
      def many( *pairs )
        pairs.collect { |pair| self.new(*pair) }
      end

    end


    # Create a new Vector with the given x and y values.
    def initialize( x, y )
      @x, @y = x.to_f, y.to_f
    end


    # Add the given vector to this one and return the
    # resulting vector.
    # 
    def +( vector )
      self.class.new( @x + vector.x,  @y + vector.y )
    end


    # Subtract the given vector from this one and return
    # the resulting vector.
    # 
    def -( vector )
      self.class.new( @x - vector.x,   @y - vector.y  )
    end


    # Return the opposite of this vector, i.e. Vector[-x, -y].
    # 
    def -@
      self.class.new( -@x, -@y )
    end


    # Multiply this vector by the given scalar (Numeric),
    # and return the resulting vector.
    # 
    def *( scalar )
      self.class.new( @x * scalar,    @y * scalar   )
    end


    # True if the given vector's x and y components are
    # equal to this vector's components (within a small margin
    # of error to compensate for floating point imprecision).
    # 
    def ==( vector )
      @x.nearly_equal?(vector.x) and @y.nearly_equal?(vector.y)
    end


    # Return this vector as an [x,y] Array.
    def to_ary
      [@x, @y]
    end

  end

end
