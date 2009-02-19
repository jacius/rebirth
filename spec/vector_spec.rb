
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Vector do

  before :each do
    @v1 = Vector.new(1,2)
    @v2 = Vector.new(3,-4)
  end

  describe "(components)" do

    it "should have an x component" do
      @v1.x.should == 1
    end

    it "should have a y component" do
      @v1.y.should == 2
    end

    it "should store x and y as floats" do
      @v1.x.should be_instance_of(Float)
      @v1.x.should be_instance_of(Float)
    end

  end


  describe "(conversions)" do
    
    it "should be convertible to array" do
      @v1.to_ary.should == [1.0, 2.0]
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
    
    it "should have an addition operator" do
      result = @v1 + @v2
      result.should be_instance_of(Vector)
      result.to_ary.should == [4,-2]
    end

    it "should have a subtraction operator" do
      result = @v1 - @v2
      result.should be_instance_of(Vector)
      result.to_ary.should == [-2,6]
    end

    it "should have a negation operator" do
      result = -(@v2)
      result.should be_instance_of(Vector)
      result.to_ary.should == [-3,4]
    end

    it "should have a scalar multiplication operator" do
      result = @v1 * 3
      result.should be_instance_of(Vector)
      result.to_ary.should == [3,6]
    end

    it "should have an equality operator" do
      @v1.should == Vector.new(1,2)
    end

  end


  it "should have an index operator" do
    @v1[0].should == 1
    @v1[1].should == 2
  end


  describe "(angles)" do
    
    it "should have an angle (radians)" do
      Vector.new(1,1).angle.should be_nearly_equal(Math::PI*0.25)
    end

    it "should have an angle (degrees)" do
      Vector.new(1,1).dangle.should == 45
    end

  end


  it "should have a magnitude" do
    @v2.magnitude.should == 5
  end


  it "should have a dot product operator" do
    @v1.dot(@v2).should == (1*3 + 2*(-4))
  end


  it "should have a perpendicular vector" do
    @v1.perp.should == Vector.new(-2,1)
  end


  it "should be projectable onto another vector" do
    @v1.projected_onto(@v2).should == Vector.new(-0.6, 0.8)
  end

end
