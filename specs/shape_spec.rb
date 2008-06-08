
describe "shape" do
  
  it "should take a :name option"
  it "should have no name by default"

  it "should take a :color option"
  it "should be white by default"
  it "should accept a symbol or color as :color"

  it "should take a :center option"
  it "should have a center of (0,0) by default"

  it "should take a :static option"
  it "should not be static by default"

  it "should take a :solid option"
  it "should be solid by default"

  it "should take a :gravity option"
  it "should ignore global gravity if :gravity is false"
  it "should have gravity enabled by default"

  it "should take a :density option"
  it "should take a :mass option"
  it "should raise error if both :density and :mass are given"
  it "should have a density of 1.0 by default"

  it "should have an :elast option"
  it "should have an elasticity of 1.0 by default"

  it "should have a :friction option"
  it "should have a friction of 1.0 by default"


  describe "(circle)" do
    
    it "should take a :radius option"
    it "should have a radius of 1.0 by default"

    it "should calculate mass from area if mass not given"

  end


  describe "(rectangle)" do
    
    it "should take a :size option"
    it "should have a size of v(1,1) by default"

    it "should calculate mass from area if mass not given"

  end

end