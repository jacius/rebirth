=begin

THE GAME:

  A ball flies back and forth across a playing field. Use the arrow
  keys to move your paddle up and down to deflect the ball. If the
  ball flies off your opponent's side of the screen, you get a point,
  but if it flies off your side of the screen, your opponent gets the
  point. The first player to get 10 points wins the game!


DEMONSTRATES:

  * Keyboard input
  * Player-controlled game objects
  * AI-controlled game objects
  * Collision detection
  * Rectangle shape
  * Non-physics-driven movement
  

CURRENT STATUS:

  * Nonfunctional (code incomplete; and library not implemented.)


AUTHOR:

  John Croisant, 2008-05-29

=end



class Paddle < GameObject

  attr_accessor :direction, :top_speed

  @@max_y =  300
  @@min_y = -300


  def initialize( params = {} )
    base_params = { 
      :color   => :white,
      :size    => [16,64],
      :static  => true,
    }

    add_shape Rectangle.new( base_params.merge(params) )

    @direction = 0; # moving up (1), down (-1), or none (0)
    @top_speed = 30

    before_update do |tick|
      self.position += v(0,1) * top_speed * direction * tick.seconds

      if self.position.y > @@max_y
        self.position = v(self.position.x, @@max_y)
      end

      if self.position.y < @@min_y
        self.position = v(self.position.x, @@min_y)
      end
    end

  end


  def bind_keys( up, down )
    when_key_pressed( up ) do
      self.direction += 1
    end

    when_key_released( up ) do
      self.direction -= 1
    end

    when_key_pressed( down ) do
      self.direction -= 1
    end

    when_key_released( down ) do
      self.direction += 1
    end
  end

end
