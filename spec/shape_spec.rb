
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Shape do

  before :each do
    @shape = Shape.new
  end

  it "should include HasTransform" do
    @shape.should be_kind_of( HasTransform )
  end

  describe "(default)" do
    
    it "depth should be 0" do
      @shape.depth.should == 0
    end

    it "should be visible" do
      @shape.should be_visible
    end

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
