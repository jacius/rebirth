
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

  it "should have a viewport" do
    @camera = Camera.new( :viewport => [1,2,3,4] )
    @camera.viewport.should == [1,2,3,4]
  end


  describe "(default)" do

    it "position should be [0,0]" do
      @camera.pos.should == [0,0]
    end
    
    it "rotation should be 0" do
      @camera.rot.should == 0
    end
    
    it "scale should be [1,1]" do
      @camera.scale.should == [1,1]
    end
    
    it "viewport should be [0,0,0,0] if View is closed" do
      @camera.viewport.should == [0,0,0,0]
    end

    it "viewport should be View's size View is open" do
      View.open([64,48])
      Camera.new.viewport.should == [0,0,64,48]
      View.close
    end

  end


  it "should be able to be made active" do
    lambda{ @camera.make_active }.should_not raise_error
  end

end
