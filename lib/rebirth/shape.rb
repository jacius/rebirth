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

# Shape is the base class for all shapes in Rebirth.
# 
class Rebirth::Shape
  include Rebirth::HasTransform

  attr_reader :depth

  # Create a new Shape with certain options:
  # 
  # :pos::     The position of the shape's center, relative to
  #            its parent (either a sprite or the world).
  #            Default: Vector[0,0].
  # 
  # :rot::     The rotation (angle) of the shape, in degrees.
  #            Rotation increases counter-clockwise.
  #            Default: 0.
  # 
  # :scale::   The x and y scale factors of the shape.
  #            scale < 1 shrinks, scale > 1 grows.
  #            Default: [1,1]
  # 
  # 
  # :depth::   The depth of the shape. Shapes with high depths
  #            appear behind shapes with low depths.
  #            Default: 0.
  # 
  # :visible:: If false, the shape is not drawn.
  #            Default: true.
  # 
  def initialize( options={} )
    super

    @depth   = (options[:depth] or 0)
    @visible = (options.has_key?(:visible) ? options[:visible] : true)
  end


  # Draw the shape on the screen.
  # 
  # This method handles OpenGL transformation, and delegates
  # to the #_draw method to perform the actual drawing in local
  # space.
  def draw
    glPushMatrix()

    glTranslate2( *@pos )
    glRotate1( @rot )
    glScale2( *@scale )

    _draw()

    glPopMatrix()
  end

  def visible?
    @visible
  end

  private

  # Called by #draw to perform the OpenGL calls to
  # actually draw the shape. Overridden by subclasses.
  # 
  # The #draw method handles translation, rotation, and
  # scaling according to @pos, @rot, and @scale, so #_draw
  # should draw in "local space".
  # 
  def _draw
  end

end
