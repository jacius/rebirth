
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


# Monkeypatch to allow resetting EventManager.
class EventManager
  def self.reset
    @@instance = new
    return nil
  end
end


describe EventManager do
  
  before :each do
    EventManager.reset
    @evm = EventManager.instance
  end

end
