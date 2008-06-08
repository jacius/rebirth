#
#
#  DEMO: Color
#
#  DESC: Displays a solid green rectangle and solid red circle.
#        Quits when Q key pressed.
#
#  DATE: 2008-06-08
#
#

require 'rebirth'
include Rebirth

view = View.open([640,480])

evm = EventManager.new

evm.append_hook(:trigger => KeyPressedTrigger.new(:q),
                :action  => BlockAction.new { throw :quit } )


class RectObject < GameObject
  def initialize( size, center )
    super()
    add_shape Rectangle.new( :size => size, :style => { :color => :green } )
    move_to(center)
  end
end

class CircleObject < GameObject
  def initialize( radius )
    super()
    add_shape Circle.new( :radius => radius, :style => { :color => :red } )
    move_to(center)
  end
end


rect   =   RectObject.new( [128,256], [0,0]    )
circle = CircleObject.new( 100,       [-250,0] )

# Register to receive DrawEvents from the event manager.
evm.register_listener( rect,   DrawEvent )
evm.register_listener( circle, DrawEvent )


catch :quit do
  loop do
    evm.update
  end
end
