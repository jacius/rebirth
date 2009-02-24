
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

  it "should include HasEventHandler" do
    @gob.should be_kind_of( Rebirth::HasEventHandler )
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

    it "should not add shapes it already has" do
      @gob.add_shapes( :shape1, :shape2, :shape1 )
      @gob.add_shapes( :shape2 )
      @gob.shapes.should == [:shape1, :shape2]
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


  describe "drawing" do
    
    it "should be able to draw" do
      @gob.should respond_to(:draw)
    end

    it "should draw its children in descending depth order" do
      deep_child = mock("deep_child", :depth => 30)
      midl_child = mock("midl_child", :depth => 20)
      near_child = mock("near_child", :depth => 10)

      deep_child.should_receive(:draw).ordered
      midl_child.should_receive(:draw).ordered
      near_child.should_receive(:draw).ordered

      @gob.add_children( midl_child, near_child, deep_child )
      @gob.draw
    end

    it "should draw its shapes in descending depth order" do
      deep_shape = mock("deep_shape", :depth => 35)
      midl_shape = mock("midl_shape", :depth => 25)
      near_shape = mock("near_shape", :depth => 15)

      deep_shape.should_receive(:draw).ordered
      midl_shape.should_receive(:draw).ordered
      near_shape.should_receive(:draw).ordered

      @gob.add_shapes( midl_shape, near_shape, deep_shape )
      @gob.draw
    end

  end

end
