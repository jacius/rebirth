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
  

CURRENT STATUS:

  * Nonfunctional (code incomplete; and library not implemented.)


AUTHOR:

  John Croisant, 2008-05-29

=end

VERY_MASSIVE = 10**15

class Paddle < GameObject

  attr_accessor :direction, :top_speed, :clamp_x


  def initialize( params = {} )
    base_params = { 
      :color   => :white,
      :size    => [16,64],
      :mass    => VERY_MASSIVE,
      :gravity => false
    }

    add_shape Rectangle.new( base_params.merge(params) )

    @direction = 0; # moving up (1), down (-1), or none (0)
    @top_speed = 30
    @clamp_x = nil;

    before_update( :name => "move" ) do |tick|
      self.velocity = v(0,1) * top_speed * direction
    end

    after_update( :name => "clamp x" ) do
      if @clamp_x
        self.position.x = @clamp_x 
        self.velocity.x = 0
      end
    end

  end


  def bind_keys( up, down )
    when_key_pressed( :key => up, :name => "+up" ) do
      self.direction += 1
    end

    when_key_released( :key => up, :name => "-up" ) do
      self.direction -= 1
    end

    when_key_pressed( :key => down, :name => "+down" ) do
      self.direction -= 1
    end

    when_key_released( :key => down, :name => "-down" ) do
      self.direction += 1
    end
  end


  def clear_keys
    clear_hooks "+up", "-up", "+down", "-down"
  end


  def ai_track_ball( ball )
    @ball = ball
    @fuzz = 10

    before_update( :name => "tracking", :priority => 10 ) do
      diff = @ball.y - self.y

      if diff > @fuzz
        self.direction = 1
      elsif diff < -@fuzz
        self.direction = 1
      else
        self.direction = 0
      end
    end
  end

end
