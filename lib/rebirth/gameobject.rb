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

need{ "drawable" }
need{ "event_handler" }


class Rebirth::GameObject
  include Rebirth::Drawable
  include Rebirth::HasEventHandler


  def initialize( options={} )
    super
    @children = []
    @shapes = []
  end


  def add_children( *children )
    @children |= children
  end


  def add_shapes( *shapes )
    @shapes |= shapes
  end


  def children
    @children.dup.freeze
  end


  def remove_children( *children )
    @children -= children
  end


  def remove_shapes( *shapes )
    @shapes -= shapes
  end


  def shapes
    @shapes.dup.freeze
  end


  private

  def _draw
    sorted = (@children + @shapes).sort { |a,b| a.depth <=> b.depth }
    sorted.reverse_each do |thing|
      thing.draw
    end
  end

end
