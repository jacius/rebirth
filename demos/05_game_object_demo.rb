#
#
#  DEMO: Game Object
#
#  DESC: Displays a solid white rectangle. Quits when Q key pressed.
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
  def initialize( size )
    super()
    add_shape Rectangle.new( :size => size )
  end

end

rect = RectObject.new( [128,256] )

# Register to receive DrawEvents from the event manager.
evm.register_listener( rect, DrawEvent )

catch :quit do
  loop do
    evm.update
  end
end
