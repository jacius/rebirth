
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Shape do

  before :each do
    @shape = Shape.new
  end

  it "should have a position" do
    @shape = Shape.new( :pos => [1,2] )
    @shape.pos.should == [1,2]
  end

end
