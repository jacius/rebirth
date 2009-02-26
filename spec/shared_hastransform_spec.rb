
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe "an object that has transform", :shared => true do

  it "default position should be Vector[0,0]" do
    @class.new.pos.should == Vector[0,0]
  end

  it "default rotation should be 0" do
    @class.new.rot.should == 0
  end

  it "default scale should be Vector[1,1]" do
    @class.new.scale.should == Vector[1,1]
  end


  it "should have a position vector" do
    @class.new( :pos => Vector[1,2] ).pos.should == Vector[1,2]
  end

  it "should convert initial position to Vector" do
    @class.new( :pos => [1,2] ).pos.should == Vector[1,2]
  end

  it "should be able to set position" do
    @instance = @class.new
    @instance.pos = Vector[4,1]
    @instance.pos.should == Vector[4,1]
  end

  it "should convert set position to Vector" do
    @instance = @class.new
    @instance.pos = [4,1]
    @instance.pos.should == Vector[4,1]
  end


  it "should have a rotation" do
    @class.new( :rot => 1 ).rot.should == 1
  end

  it "should convert initial rotation to float" do
    @class.new( :rot => 10 ).rot.should be_instance_of(Float)
  end

  it "should able to set rotation" do
    @instance = @class.new
    @instance.rot = 45
    @instance.rot.should == 45
  end

  it "should convert set rotation to float" do
    @instance = @class.new
    @instance.rot = 45
    @instance.rot.should be_instance_of(Float)
  end


  it "should have a scale" do
    @class.new( :scale => Vector[1,2] ).scale.should == Vector[1,2]
  end

  it "should convert initial scale to Vector" do
    @class.new( :scale => [1,2] ).scale.should == Vector[1,2]
  end

  it "should be able to set scale" do
    @instance = @class.new
    @instance.scale = Vector[3,4]
    @instance.scale.should == Vector[3,4]
  end

  it "should convert set scale to Vector" do
    @instance = @class.new
    @instance.scale = [3,4]
    @instance.scale.should == Vector[3,4]
  end

end
