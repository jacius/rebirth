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

# The Camera class controls your point of view within the scene,
# i.e. which part of the scene you see on the screen.
# 
# You can have as many Camera instances as you want, but only the
# active camera is used when drawing the scene; see #make_active. Only
# one camera can be active at a time, but you can do neat tricks like
# side-by-side views by drawing the scene multiple times per frame,
# once from each camera.
# 
class Rebirth::Camera
  include Rebirth::HasTransform

  attr_reader :viewport, :bgcolor

  @@active_camera = nil

  # Returns the currently active camera instance, or nil if there
  # is no active camera.
  # 
  def self.active_camera
    @@active_camera
  end

  # Unset the active camera, i.e. sets the active camera to nil.
  # 
  def self.clear_active_camera
    @@active_camera = nil
  end


  # Create a new Camera with certain options.
  #
  # The new Camera automatically becomes the active camera if there is
  # no active camera.
  # 
  # :pos::       The position of the camera's center, relative to
  #              the world.
  #              Default: Vector[0,0].
  # 
  # :rot::       The rotation (angle) of the camera, in degrees.
  #              Rotation increases counter-clockwise.
  #              Default: 0.
  # 
  # :scale::     The x and y scale (or zoom) factors of the camera.
  #              scale < 1 zooms out (objects appear smaller),
  #              scale > 1 zooms in (objects appear larger).
  #              If the x and y factors are not the same, objects in
  #              the scene will appear squashed/stretched.
  #              Default: [1,1]
  # 
  # :viewport::  A [left, bottom, width, height] array specifying
  #              which part of the View (window) to draw to.
  #              See also #reset_from_view.
  #              Default: the entire View.
  # 
  # :bgcolor::   The background color for the camera.
  #              Default: [0,0,0,1] (black)
  # 
  def initialize( options={} )
    super

    @viewport = (options[:viewport] or reset_from_view)
    @bgcolor  = (options[:bgcolor]  or [0,0,0,1])
    
    make_active unless self.class.active_camera
  end


  # Make this Camera the active camera. When the scene is drawn,
  # it is drawn according to the settings of the active camera.
  #
  # There can only be one active camera at a time, but you can
  # show multiple camera viewpoints by making Camera 1 active,
  # drawing, making Camera 2 active, drawing again, and so on.
  # 
  def make_active
    @@active_camera = self
    _setup_viewport
    _setup_rendering
    _setup_projection
  end


  # Reset the camera's viewport to cover the entire View.
  # This is useful to call after the View has been resized.
  # 
  def reset_from_view
    if Rebirth::View.open?
      @viewport = [0,0] + Rebirth::View.size
    else
      @viewport = [0,0,0,0]
    end
  end


  # Perform some OpenGL magic to prepare for the scene to
  # be drawn. You must call this method every frame before
  # any objects are drawn, or the scene will look wrong.
  # 
  def pre_draw
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)

    glLoadIdentity()
    glScale2( *@scale )
    glRotate1( -@rot )
    glTranslate2( *(-@pos) )
  end

  # Perform some OpenGL magic to clean up after drawing
  # the scene. You must call this method every frame after
  # all objects have been drawn, or the screen won't refresh.
  # 
  def post_draw
    glFlush()
    Rubygame::GL.swap_buffers
  end


  private

  # Perform some OpenGL magic to set up the Camera's projection
  # matrix. This is called by #make_active.
  # 
  def _setup_projection
		glMatrixMode( GL_PROJECTION )
		glLoadIdentity()

    w2,h2 = @viewport.at(2)*0.5, @viewport.at(3)*0.5

    # Scene will be translated at render time.
		glOrtho(-w2, w2, -h2, h2, 0, 100)

    glMatrixMode( GL_MODELVIEW )
  end

  # Perform some OpenGL magic to set up some rendering stuff.
  # This is called by #make_active.
  def _setup_rendering
		glEnable(GL_DEPTH_TEST)
		glDepthFunc(GL_LESS)
    glClearDepth(100)

    glClearColor(*@bgcolor)

		glEnable(GL_SCISSOR_TEST)
  end

  # Perform some OpenGL magic to set up the viewport.
  # This is called by #make_active.
  def _setup_viewport
		glViewport( *@viewport )
		glScissor( *@viewport )
  end
  

end
