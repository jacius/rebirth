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


    # Return a component of this vector as if it were an
    # [x,y] Array.
    # 
    def []( index )
      self.to_ary[index]
    end

    alias :at :[]


    # Return the angle of this vector, relative to the positive
    # X axis, in radians. Use #dangle for degrees.
    # 
    def angle
      Math.atan2( @y, @x )
    end


    # Return the angle of this vector relative to the other vector,
    # in radians. Use #dangle_with for degrees.
    # 
    def angle_with( vector )
      Math.acos( self.udot(vector) )
    end


    # Return the angle of this vector, relative to the positive
    # X axis, in degrees. Use #angle for radians.
    # 
    def dangle
      angle.to_deg
    end


    # Return the angle of this vector relative to the other vector,
    # in radians. Use #angle_with for radians.
    # 
    def dangle_with( vector )
      angle_with(vector).to_deg
    end


    # Return the dot product between this vector and the other vector.
    def dot( vector )
      (@x * vector.x) + (@y * vector.y)
    end


    # Return the magnitude (distance) of this vector.
    def magnitude
      Math.hypot( @x, @y )
    end


    # Return a copy of this vector, but rotated 90 degrees
    # counter-clockwise.
    # 
    def perp
      self.class.new( -@y, @x )
    end


    # Return a new vector which is this vector projected onto
    # the other vector.
    # 
    def projected_onto( v )
      self.class.new(  *(v * v.dot(self) * (1/v.magnitude**2) )  )
    end


    # Return a copy of this vector, but with angle increased by
    # the given amount, in radians. Use #drotate for degrees.
    # 
    def rotate( angle )
      self.class.new_am( self.angle + angle, self.magnitude )
    end


    # Return a copy of this vector, but with angle increased by
    # the given amount, in degrees. Use #rotate for radians.
    # 
    def drotate( angle )
      self.class.new_dam( self.dangle + angle, self.magnitude )
    end


    # Return a copy of this vector, but scaled separately on each axis.
    # The new vector will be Vector[ x*scale_x, y*scale_y ].
    # 
    def stretch( scale_x, scale_y )
      self.class.new( self.x * scale_x, self.y * scale_y )
    end


    # Return this vector as an [x,y] Array.
    def to_ary
      [@x, @y]
    end


    def to_s
      "#{self.class.name}[#{@x}, #{@y}]"
    end

    alias :inspect :to_s


    # Return the dot product of this vector's #unit and the other
    # vector's #unit.
    # 
    def udot( vector )
      self.unit.dot( vector.unit )
    end


    # Return a copy of this vector, but with a magnitude of 1.
    def unit
      self * (1/magnitude())
    end

  end

end
