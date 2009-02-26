
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
R = Rebirth
GameObject = Rebirth::GameObject

need { "shared_hastransform_spec" }
need { "shared_drawable_spec" }


describe GameObject do

  before :each do
    @class = GameObject
    @gob = GameObject.new
  end

  it_should_behave_like "a drawable"
  it_should_behave_like "an object that has transform"

  it "should include HasTransform" do
    @gob.should be_kind_of( Rebirth::HasTransform )
  end

  it "should include HasEventHandler" do
    @gob.should be_kind_of( Rebirth::HasEventHandler )
  end

  it "should include Drawable" do
    @gob.should be_kind_of( Rebirth::Drawable )
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


    # Helper class to test the order of drawing.
    # Appends its name to the target when draw is called.
    class Ordered
      attr_reader :depth
      def initialize(name, target, depth)
        @name, @target, @depth = name, target, depth
      end
      def draw
        @target << @name
      end
    end
    
    it "should draw its children in descending depth order" do
      order = []
      deep_child = Ordered.new("deep_child", order, 30)
      midl_child = Ordered.new("midl_child", order, 20)
      near_child = Ordered.new("near_child", order, 10)

      @gob.add_children( midl_child, near_child, deep_child )
      @gob.draw

      order.should == ["deep_child", "midl_child", "near_child"]
    end

    it "should draw its shapes in descending depth order" do
      order = []
      deep_shape = Ordered.new("deep_shape", order, 30)
      midl_shape = Ordered.new("midl_shape", order, 20)
      near_shape = Ordered.new("near_shape", order, 10)

      @gob.add_shapes( midl_shape, near_shape, deep_shape )
      @gob.draw

      order.should == ["deep_shape", "midl_shape", "near_shape"]
    end

    it "should draw shapes and children intermixed" do
      order = []
      
      deep_child = Ordered.new("deep_child", order, 30)
      midl_child = Ordered.new("midl_child", order, 20)
      near_child = Ordered.new("near_child", order, 10)

      deep_shape = Ordered.new("deep_shape", order, 35)
      midl_shape = Ordered.new("midl_shape", order, 25)
      near_shape = Ordered.new("near_shape", order, 15)

      @gob.add_children( midl_child, near_child, deep_child )
      @gob.add_shapes( midl_shape, near_shape, deep_shape )
      @gob.draw

      order.should == ["deep_shape", "deep_child",
                       "midl_shape", "midl_child",
                       "near_shape", "near_child"]
    end

  end

end
