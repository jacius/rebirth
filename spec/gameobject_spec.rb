
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
R = Rebirth
GameObject = Rebirth::GameObject


describe GameObject do

  before :each do
    @gob = GameObject.new
  end

  it "should include HasTransform" do
    @gob.should be_kind_of( Rebirth::HasTransform )
  end


  describe "(default)" do
    
    it "should have no shapes" do
      @gob.should have(:no).shapes
    end

    it "should have no children" do
      @gob.should have(:no).children
    end

  end

  
  it "public-visible shapes array should be frozen" do
    @gob.shapes.should be_frozen
  end

end
