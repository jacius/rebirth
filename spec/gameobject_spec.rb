
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
  
end
