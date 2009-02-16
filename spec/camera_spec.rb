
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Camera do

  before :each do
    @camera = Camera.new
  end

  it "should have a position" do
    @camera = Camera.new( :pos => [1,1] )
    @camera.pos.should == [1,1]
  end

end
