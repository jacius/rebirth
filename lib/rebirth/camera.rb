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

  attr_reader :pos, :rot, :scale, :viewport, :bgcolor

  @@active_camera = nil


  def self.active_camera
    @@active_camera
  end

  def self.clear_active_camera
    @@active_camera = nil
  end


  def initialize( options={} )
    @pos      = (options[:pos]      or [0,0])
    @rot      = (options[:rot]      or 0)
    @scale    = (options[:scale]    or [1,1])
    @viewport = (options[:viewport] or reset_from_view)
    @bgcolor  = (options[:bgcolor]  or [0,0,0,1])
    
    make_active unless self.class.active_camera
  end


  def make_active
    @@active_camera = self
    _setup_viewport
    _setup_rendering
    _setup_projection
  end

  def reset_from_view
    if Rebirth::View.open?
      @viewport = [0,0] + Rebirth::View.size
    else
      @viewport = [0,0,0,0]
    end
  end


  def pre_draw
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT)

    glLoadIdentity()
    glScale( @scale.at(0), @scale.at(1), 1 )
    glRotate( -@rot, 0, 0, 1 )
    glTranslate( -@pos.at(0), -@pos.at(1), 0 )
  end

  def post_draw
    glFlush()
    Rubygame::GL.swap_buffers
  end


  private

  def _setup_projection
		glMatrixMode( GL_PROJECTION )
		glLoadIdentity()

    w2,h2 = @viewport.at(2)*0.5, @viewport.at(3)*0.5

    # Scene will be translated at render time.
		glOrtho(-w2, w2, -h2, h2, 0, 100)

    glMatrixMode( GL_MODELVIEW )
  end

  def _setup_rendering
		glEnable(GL_DEPTH_TEST)
		glDepthFunc(GL_LESS)
    glClearDepth(100)

    glClearColor(*@bgcolor)

		glEnable(GL_SCISSOR_TEST)
  end

  def _setup_viewport
		glViewport( *@viewport )
		glScissor( *@viewport )
  end
  

end
