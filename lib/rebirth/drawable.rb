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

need{ "hastransform" }


# Drawable is a mixin module for objects that can be drawn
# on the screen, for example GameObject and Shape.
# 
# It defines the @visible and @depth attributes, and the
# #draw and #_draw methods. Subclasses should override
# #_draw to implement the proper drawing behavior.
# 
# Drawable includes the HasTransform mixin module, and
# uses @pos, @rot, and @scale.
# 
module Rebirth::Drawable
  include Rebirth::HasTransform

  attr_accessor :depth, :visible
  alias :visible? :visible


  # Create a new object with certain options:
  # 
  # :depth::   The depth of the object. Shapes with high depths
  #            appear behind objects with low depths.
  #            Default: 0.
  # 
  # :visible:: If false, the object is not drawn.
  #            Default: true.
  # 
  # Also accepts :pos, :rot, and :scale.
  # See Rebirth::HasTransform.
  # 
  def initialize( options={} )
    super
  rescue ArgumentError
    super() # maybe super takes no args
  ensure
    @depth   = (options[:depth] or 0)
    @visible = (options.has_key?(:visible) ? options[:visible] : true)
  end


  # Draw the object on the screen.
  # 
  # This method handles OpenGL transformation, and delegates
  # to the #_draw method to perform the actual drawing in local
  # space.
  # 
  def draw
    if @visible
      glPushMatrix()

      glTranslate2( *@pos )
      glRotate1( @rot )
      glScale2( *@scale )

      _draw

      glPopMatrix()
    end
  end


  # Called by #draw to perform the OpenGL calls to
  # actually draw the object. Overridden by subclasses.
  # 
  # The #draw method handles translation, rotation, and
  # scaling according to @pos, @rot, and @scale, so #_draw
  # should draw in "local space".
  # 
  def _draw
  end

end
