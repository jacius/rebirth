
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

    it "should not add children it already has" do
      @gob.add_children( :child1, :child2, :child1 )
      @gob.add_children( :child2 )
      @gob.children.should == [:child1, :child2]
    end

    it "should be able to remove children" do
      @gob.add_children( :child1, :child2, :child3, :child4 )
      @gob.remove_children( :child2, :child4 )
      @gob.children.should == [:child1, :child3]
    end

    it "removing a missing child should have no effect" do
      @gob.add_children( :child1, :child2, :child3 )
      @gob.remove_children( :child4 )
      @gob.children.should == [:child1, :child2, :child3]
    end

  end


  describe "shapes" do

    it "should appear frozen" do
      @gob.shapes.should be_frozen
    end

    it "should be able to add shapes" do
      @gob.add_shapes( :shape1, :shape2, :shape3 )
      @gob.shapes.should == [:shape1, :shape2, :shape3]
    end

    it "should be able to remove shapes" do
      @gob.add_shapes( :shape1, :shape2, :shape3, :shape4 )
      @gob.remove_shapes( :shape2, :shape4 )
      @gob.shapes.should == [:shape1, :shape3]
    end

    it "removing a missing shape should have no effect" do
      @gob.add_shapes( :shape1, :shape2, :shape3 )
      @gob.remove_shapes( :shape4 )
      @gob.shapes.should == [:shape1, :shape2, :shape3]
    end

  end


end
