
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


  describe "(conversions)" do
    
    it "should be convertible to array" do
      Vector.new(1.0, 2.0).to_ary.should == [1.0, 2.0]
    end

  end


  describe "(constructors)" do
    
    it "should have a square brackets constructor" do
      Vector[1,2].should be_instance_of(Vector)
    end

    it "should have a polar constructor (radians)" do
      n = 0.707106781186548
      @v = Vector.new_am(Math::PI * 0.25, 1.0)
      @v.x.should be_nearly_equal(n)
      @v.y.should be_nearly_equal(n)
    end

    it "should have a polar constructor (degrees)" do
      n = 0.707106781186548
      @v = Vector.new_dam(45, 1.0)
      @v.x.should be_nearly_equal(n)
      @v.y.should be_nearly_equal(n)
    end

    it "should have an en masse constructor" do
      arrays = [[1,2], [3,4], [5,6]]
      vectors = Vector.many( *arrays )

      vectors.each_with_index { |vector,i|
        vector.should be_instance_of(Vector)
        vector.x.should == arrays[i][0]
        vector.y.should == arrays[i][1]
      }
    end

  end


  describe "(math)" do
    
    before :each do
      @v1 = Vector.new(1,2)
      @v2 = Vector.new(3,-4)
    end

    it "should have an addition operator" do
      result = @v1 + @v2
      result.should be_instance_of(Vector)
      result.to_ary.should == [4,-2]
    end

  end

end
