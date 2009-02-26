
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth

need { "shared_drawable_spec" }

describe Shape do

  before :each do
    @shape = Shape.new
    @class = Shape
  end

  it "should include HasTransform" do
    @shape.should be_kind_of( HasTransform )
  end

  it_should_behave_like "a drawable"

end
