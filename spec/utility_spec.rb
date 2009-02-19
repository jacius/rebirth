
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe "Numeric#nearly_equal?" do
  
  it "should be true if within the threshold" do
    (0.4).should be_nearly_equal(0.41, 0.02)
  end

  it "should be false if outside the threshold" do
    (0.4).should_not be_nearly_equal(0.43, 0.02)
  end

  it "should work with two Floats" do
    (1.0).should be_nearly_equal(1.01, 0.02)
  end

  it "should work with two integers" do
    (1).should be_nearly_equal(2, 2)
  end

  it "should work with a Float and an integer" do
    (1.01).should be_nearly_equal(1, 0.02)
  end

end
