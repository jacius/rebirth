
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Vector do

  describe "(components)" do
    
    before :each do
      @v = Vector.new(1,2)
    end
    
    it "should have an x component" do
      @v.x.should == 1
    end

    it "should have a y component" do
      @v.y.should == 2
    end

    it "should store x and y as floats" do
      @v.x.should be_instance_of(Float)
      @v.x.should be_instance_of(Float)
    end

  end


  describe "(constructors)" do
    
    it "should have a square brackets constructor" do
      Vector[1,2].should be_instance_of(Vector)
    end

  end

end
