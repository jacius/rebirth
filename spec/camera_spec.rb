
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

  it "should have a rotation" do
    @camera = Camera.new( :rot => 15 )
    @camera.rot.should == 15
  end

  it "should have a scale" do
    @camera = Camera.new( :scale => [2,2] )
    @camera.scale.should == [2,2]
  end

end
