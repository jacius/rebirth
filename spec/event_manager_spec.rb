
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

  it "should be a singleton class" do
    @evm.should be_kind_of(Singleton)
  end

  it "should accept pushed events" do
    lambda { @evm.push(:myevent) }.should_not raise_error
  end

end
