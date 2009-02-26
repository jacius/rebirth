
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe "a drawable", :shared => true do
  
  it "should have depth 0 by default" do
    @class.new.depth.should == 0
  end

  it "should be visible by default" do
    @class.new.should be_visible
  end

  it "should have a depth attribute" do
    @class.new( :depth => 1 ).depth.should == 1
  end

  it "should have a visibility attribute" do
    @class.new( :visible => false ).should_not be_visible
  end

  it "should have a draw method" do
    @class.new.should respond_to(:draw)
  end

end
