
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe View do

  after :each do
    View.close
  end
  
  it "should be closed by default" do
    View.should_not be_open
  end

  it "should be open after being opened" do
    View.open([640,480])
    View.should be_open
  end

  it "should return an instance when opened" do
    View.open([640,480]).should be_instance_of(View)
  end

  it "should be closed after being closed" do
    View.open([640,480])
    View.close
    View.should_not be_open
  end

  it "should have a singleton instance" do
    View.instance.should be_instance_of(View)
  end

  it "should have a size" do
    View.open([640,480])
    View.size.should == [640,480]
  end

end
