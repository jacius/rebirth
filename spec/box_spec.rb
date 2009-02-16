
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe Box do

  before :each do
    @box = Box.new
  end

  it "should be a Shape" do
    @box.should be_kind_of( Shape )
  end

end
