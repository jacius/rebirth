
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth

need { "shared_drawable_spec" }
need { "shared_hastransform_spec" }

describe Shape do

  before :each do
    @class = Shape
  end

  it_should_behave_like "a drawable"
  it_should_behave_like "an object that has transform"

  it "should include HasTransform" do
    Shape.new.should be_kind_of( HasTransform )
  end

  it "should include Drawable" do
    Shape.new.should be_kind_of( Drawable )
  end

end
