
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


class Transformer
  include HasTransform
end


describe HasTransform do

  before :each do
    @class = Transformer
    @instance = @class.new
  end

  describe "(default)" do
    
    it "position should be Vector[0,0]" do
      @instance.pos.should == Vector[0,0]
    end

    it "rotation should be 0" do
      @instance.rot.should == 0
    end

    it "scale should be [1,1]" do
      @instance.scale.should == [1,1]
    end

  end


  it "should have a position vector" do
    @instance = @class.new( :pos => Vector[1,2] )
    @instance.pos.should == Vector[1,2]
  end

  it "should convert initial position to Vector" do
    @instance = @class.new( :pos => [1,2] )
    @instance.pos.should == Vector[1,2]
  end

  it "should be able to set position" do
    @instance.pos = Vector[4,1]
    @instance.pos.should == Vector[4,1]
  end

  it "should convert set position to Vector" do
    @instance.pos = [4,1]
    @instance.pos.should == Vector[4,1]
  end


  it "should have a rotation" do
    @instance = @class.new( :rot => 1 )
    @instance.rot.should == 1
  end

  it "should convert initial rotation to float" do
    @instance = @class.new( :rot => 10 )
    @instance.rot.should be_instance_of(Float)
  end

  it "should able to set rotation" do
    @instance.rot = 45
    @instance.rot.should == 45
  end

  it "should convert set rotation to float" do
    @instance.rot = 45
    @instance.rot.should be_instance_of(Float)
  end


  it "should have a scale" do
    @instance = @class.new( :scale => Vector[1,2] )
    @instance.scale.should == Vector[1,2]
  end

  it "should convert initial scale to Vector" do
    @instance = @class.new( :scale => [1,2] )
    @instance.scale.should == Vector[1,2]
  end

  it "should be able to set scale" do
    @instance.scale = Vector[3,4]
    @instance.scale.should == Vector[3,4]
  end

  it "should convert set scale to Vector" do
    @instance.scale = [3,4]
    @instance.scale.should == Vector[3,4]
  end

end
