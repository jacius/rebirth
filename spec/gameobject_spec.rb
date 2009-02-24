
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
    
    it "should have no children" do
      @gob.should have(:no).children
    end

    it "should have no shapes" do
      @gob.should have(:no).shapes
    end

  end


  describe "children" do
    
    it "should appear frozen" do
      @gob.children.should be_frozen
    end

    it "should be able to add children" do
      @gob.add_children( :child1, :child2, :child3 )
      @gob.children.should == [:child1, :child2, :child3]
    end

  end


  describe "shapes" do

    it "should appear frozen" do
      @gob.shapes.should be_frozen
    end

  end


end