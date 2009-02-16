
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Camera do

  before :each do
    @camera = Camera.new
  end

  it "should have a position" do
    @camera = Camera.new( :pos => [1,1] )
    @camera.pos.should == [1,1]
  end

  it "should have a rotation" do
    @camera = Camera.new( :rot => 15 )
    @camera.rot.should == 15
  end

  it "should have a scale" do
    @camera = Camera.new( :scale => [2,2] )
    @camera.scale.should == [2,2]
  end

  it "should have a viewport" do
    @camera = Camera.new( :viewport => [1,2,3,4] )
    @camera.viewport.should == [1,2,3,4]
  end


  describe "(default)" do

    it "position should be [0,0]" do
      @camera.pos.should == [0,0]
    end
    
    it "rotation should be 0" do
      @camera.rot.should == 0
    end
    
    it "scale should be [1,1]" do
      @camera.scale.should == [1,1]
    end
    
    it "viewport should be [0,0,0,0] if View is closed" do
      @camera.viewport.should == [0,0,0,0]
    end

    it "viewport should be View's size View is open" do
      View.open([64,48])
      Camera.new.viewport.should == [0,0,64,48]
      View.close
    end

  end


  describe "(no active camera)" do
    
    it "active camera should be nil" do
      Camera.active_camera.should be_nil
    end

    it "should be able to be made active" do
      @camera.make_active
      Camera.active_camera.should == @camera
    end

  end


  describe "(active camera)" do
    
    after :each do 
      Camera.clear_active_camera
    end

    it "active camera should be the active camera" do
      @camera.make_active
      Camera.active_camera.should == @camera
    end

    it "should be able to change active camera" do
      @camera.make_active

      @camera2 = Camera.new
      @camera2.make_active

      Camera.active_camera.should == @camera2
    end

    it "class should be able to clear active camera" do
      @camera.make_active
      Camera.clear_active_camera
      Camera.active_camera.should == nil
    end
    
  end


  describe "(reset from view)" do

    after :each do
      View.close
    end
    
    it "should be able to reset viewport from View" do
      View.open([32,32])
      @camera.reset_from_view
      @camera.viewport.should == [0,0,32,32]
    end

  end


end
