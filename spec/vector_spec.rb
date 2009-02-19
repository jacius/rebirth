
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Vector do

  before :each do
    @v = Vector.new(1,2)
  end
  
  it "should have an x component" do
    @v.x.should == 1
  end

  it "should have a y component" do
    @v.y.should == 2
  end

end
