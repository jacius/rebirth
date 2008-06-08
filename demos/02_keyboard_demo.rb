#
#
#  DEMO: Keyboard events
#
#  DESC: Empty view, nothing displayed. Quits when Q key pressed.
#
#  DATE: 2008-06-08
#
#

require 'rebirth'
include Rebirth

View.open([640,480])

evm = EventManager.new

evm.append_hook(:trigger => KeyPressedTrigger.new(:q),
                :action  => BlockAction.new { throw :quit } )

catch :quit do
  loop do
    evm.update
  end
end
