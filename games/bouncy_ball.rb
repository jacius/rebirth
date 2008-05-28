=begin

THE GAME:

  A ball bounces inside a room. Point and click the ball to
  gain a point and send it up into the air. But if it touches
  the floor, you lose a point!

  Get 15 points to win!


DEMONSTRATES:

  * GameObject class inheritance.
  * Visible shapes (Circle, Line).
  * Loose physical shapes which fall and bounce.
  * Static physical shapes which don't move.
  * The Game class.
  * The World class.
  * The when_clicked event hook.
  * The when_collided event hook.
  

CURRENT STATUS:

  * All game parts complete.
  * Library requirements not implemented.


AUTHOR:

  John Croisant, 2008-05-27

=end



# Represents a bouncing ball.
class Ball < GameObject
  # Set up the physical and visual properties of the ball.
  def initialize( params )
    base_params = { 
      :center  => v(0,0),
      :radius  => 15.0,
      :density => 5.0,
      :elast   => 0.9,
      :color   => :red
    }
    
    add_shape Circle.new( base_params.merge(params) )
  end
end


class Wall < GameObject
  def initialize( p1, p2 )
    base_params = { 
      :color     => :white,
      :thickness => 3.0,
      :static    => true,
      :elast     => 1.0
    }    
  
    add_shape Line.new( base_params.merge(:points => [p1,p2]) )
  end
end



def make_game
  game = Game.new
  
  game[:score] = 0
  game.background = :black
  
  game.when_key_pressed(:q) do
    puts "Bye!"
    exit
  end
  
  game.when_true( proc{ game[:score] >= 15 } ) do
    puts "You got 15 points! You win! \m/"
    exit
  end
  
  return game
end


def make_world
  return World.new( :gravity => v(0,-9.8) )
end


def make_ball
  return Ball.new
end


def make_walls
  points = [ v( 100,   0), v( 100, 400), v(-100, 400), v(-100,   0) ]
  # Make a wall between each pair of points.
  return points.enum_cons(2).collect { |points| Wall.new( *points )}
end


def make_floor
  return Wall.new( v(-100, 5), v(100, 5) )
end



def main
  $game = make_game
  $game[:walls] = make_walls
  $game[:floor] = make_floor
  $game[:ball]  = make_ball
  
  $game.world = make_world
  $game.world.add( floor, ball, walls )

  $game[:ball].when_clicked do |click|
    $game[:score] += 1
    $game[:ball].shove( :from => click.pos, :strength => 30.0 )
  end
  
  $game[:floor].when_collided( :with => $game[:ball] ) do
    $game[:score] -= 1 unless $game[:score] - 1 < 0
  end
  
  $game.after_update do
    $game.title = "Bounce the ball! (%d pts)"%$game[:score]
  end
  
  $game.go
end
