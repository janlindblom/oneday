require "oneday"

describe "Oneday::Reader" do
  before :each do
    @reader = Oneday::Reader.new(config_file: "/tmp/oneday_test.conf")
  end

  it "has a configuration object" do
    expect(@reader.configuration).not_to be_nil
  end
  
  it "knows where to find entries" do
    expect(@reader.entries).to be_instance_of(Array)
  end
  
  it "knows where to find pictures in entries" do
    expect(@reader.pictures).to be_instance_of(Array)
  end
end