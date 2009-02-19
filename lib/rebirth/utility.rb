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

# General purpose utility methods.


class Numeric

  @@rad_to_deg = 180.0/Math::PI
  @@deg_to_rad = Math::PI/180.0

  # True if the distance between this number and the other number
  # is less than or equal to the threshold. Useful for testing Floats.
  # 
	def nearly_equal?(other, threshold=0.00000000001 )
		return (self - other).abs <= threshold
	end


  # Assume this is an angle in radians, and convert to degrees.
  def to_deg
    self * @@rad_to_deg
  end

  # Assume this is an angle in degrees, and convert to radians.
  def to_rad
    self * @@deg_to_rad
  end

end
