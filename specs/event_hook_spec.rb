
describe "event hook" do

  
  it "should take a hash of options"
  it "should have a :name option"
  it "should reject :name that is not a string or symbol"

  it "should have a :priority option"
  it "should reject non-numeric priorities"
  it "should have a default priority of 0"
  it "should run before hooks with lower priorities"

  it "should take a block"
  it "should yield an event to the block"



  describe "(keyboard)" do
    
    it "should have a :key option"
    it "should reject non-symbol values for :key"
    it "should have a default :key of :any"

    it "should take a :modifiers option"
    it "should reject non-Array values for :modifiers"
    it "should have an empty Array of :modifiers by default"

  end


  describe "(mouse)" do
    
    it "should have a :button option"
    it "should reject non-symbol values for :button"
    it "should have a default :button of :any"

    it "should take a :modifiers option"
    it "should reject non-Array values for :modifiers"
    it "should have an empty Array of :modifiers by default"

  end



end


