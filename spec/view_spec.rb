
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )

require 'rebirth'
include Rebirth


describe View do

  after :each do
    View.close
  end


  describe "(default)" do
    it "should not be open" do
      View.should_not be_open      
    end

    it "should have no size" do
      View.size.should be_nil
    end

    it "closing should have no effect" do
      old_open = View.open?
      View.close
      View.open?.should == old_open
    end

    it "should become open after opening" do
      View.open([32,24])
      View.should be_open
    end

    it "opening the view should return an instance" do
      View.open([32,24]).should be_instance_of(View)
    end
  end



  describe "(open)" do
    before :each do
      View.open([64,48])
    end

    it "should be open" do
      View.should be_open
    end

    it "should have a size" do
      View.size.should == [64,48]
    end

    it "reopening the view should return an instance" do
      View.open([32,24]).should be_instance_of(View)
    end

    it "the reopened view should have the new size" do
      View.open([32,24])
      View.size.should == [32,24]
    end

    it "should still be open after reopening" do
      View.open([32,24])
      View.should be_open
    end

    it "should have a singleton instance" do
      View.instance.should be_instance_of(View)
    end

    it "should become closed after closing" do
      View.close
      View.should_not be_open
    end
  end



  describe "(closed)" do
    before :each do
      View.open([64,48])
      View.close
    end

    it "should be closed after being closed" do
      View.should_not be_open
    end

    it "should have no size" do
      View.size.should be_nil
    end

    it "closing should have no effect" do
      old_open = View.open?
      View.close
      View.open?.should == old_open
    end

    it "reopening the view should return an instance" do
      View.open([32,24]).should be_instance_of(View)
    end

    it "reopened view should have the given size" do
      View.open([32,24])
      View.size.should == [32,24]
    end

    it "should become open after opening" do
      View.open([32,24])
      View.should be_open
    end
  end



end
