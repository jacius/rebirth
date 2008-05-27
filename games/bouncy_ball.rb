=begin

THE GAME:

  A ball bounces inside a cup. Point and click the ball to
  gain a point and send it up into the air. But if it touches
  the bottom of the cup, you lose a point!

  Get 15 points to win!


DEMONSTRATES:

  * Visible shapes (Circle, Lines).
  * Physical shapes which fall and bounce.
  * The when_clicked event hook.
  * The when_collided event hook.


CURRENT STATUS:

  * Incomplete (needs game loop).
  * Does not run.

=end


PI = Math::PI


# Represents a bouncing ball.
class Ball < GameObject
  
  # Set up the physical and visual properties of the ball.
  def initialize( params )
    base_params = { 
      :center  => v(0,0),
      :radius  => 1.0,
      :density => 5.0,
      :elast   => 0.9, 
      :solid   => true,
      :emit    => true,
      :gravity => v(0,-9.8),
      :color   => :red
    }
    
    @shape = Circle.new( base_params.merge(params) )
  end

end


# Create walls to bounce off of.
def make_walls
  corners = [ v(-100, 400),
              v(-100,   0),
              v( 100,   0),
              v( 100, 400) ]
  
  base_params = { 
    :color     => :black,
    :thickness => 3.0,
    :solid     => true,
    :static    => true,
    :elast     => 1.0
  }

  corners.enum_cons(2).collect { |p1, p2|
    Line.new( base_params.merge(:points => [p1,p2]) )
  }
end


def setup

  $score = 0
  
  ball = Ball.new
  ball.when_clicked { |click|
    # When you click the ball:
    #  - Gain a point.
    #  - Push the ball away from the cursor.

    $score += 1
    @shape.push( :from => click.pos, :force => 30.0 )
  }
  
  walls = make_walls

  bottom = walls[1]
  bottom.when_collided( :with => ball ) { |b|
    # When the ball hits the bottom, lose a point,
    # but don't fall below 0.

    $score -= 1 unless $score - 1 < 0
  }
end

