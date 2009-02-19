
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Shape do

  before :each do
    @shape = Shape.new
  end


  describe "(default)" do
    
    it "position should be Vector[0,0]" do
      @shape.pos.should == Vector[0,0]
    end

    it "rotation should be 0" do
      @shape.rot.should == 0
    end

    it "scale should be [1,1]" do
      @shape.scale.should == [1,1]
    end

    it "depth should be 0" do
      @shape.depth.should == 0
    end

    it "should be visible" do
      @shape.should be_visible
    end

  end


  it "should have a position" do
    @shape = Shape.new( :pos => [1,2] )
    @shape.pos.should == [1,2]
  end

  it "should have a rotation" do
    @shape = Shape.new( :rot => 1 )
    @shape.rot.should == 1
  end

  it "should have a scale" do
    @shape = Shape.new( :scale => [1,2] )
    @shape.scale.should == [1,2]
  end

  it "should have a depth" do
    @shape = Shape.new( :depth => 1 )
    @shape.depth.should == 1
  end

  it "should have visibility" do
    @shape = Shape.new( :visible => false )
    @shape.should_not be_visible
  end


  it "should have a draw method" do
    @shape.should respond_to(:draw)
  end

end
