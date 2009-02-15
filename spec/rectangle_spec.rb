
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Rectangle do

  before :each do
    @rect = Rectangle.new
  end

  it "should be a Shape" do
    @rect.should be_kind_of( Shape )
  end

end
