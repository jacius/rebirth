
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


  describe "(default)" do
    
    it "size should be [1,1]" do
      @rect.size.should == [1,1]
    end

  end


  it "should have a size" do
    @rect = Rectangle.new( :size => [1,2] )
    @rect.size.should == [1,2]
  end

end
