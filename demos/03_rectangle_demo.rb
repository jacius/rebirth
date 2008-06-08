#
#
#  DEMO: Rectangle
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

rect = Rectangle.new( :size => [128,256] )

# Draw when DrawEvent received.
rect.append_hook(:trigger => InstanceOfTrigger.new(DrawEvent),
                 :action  => BlockAction.new { rect.draw(view) } )

# Register to receive DrawEvents from the event manager.
evm.register_listener( rect, DrawEvent )

catch :quit do
  loop do
    evm.update
  end
end
