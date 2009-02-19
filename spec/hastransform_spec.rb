
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

  it "should have a rotation" do
    @instance = @class.new( :rot => 1 )
    @instance.rot.should == 1
  end

  it "should have a scale" do
    @instance = @class.new( :scale => [1,2] )
    @instance.scale.should == [1,2]
  end

end
