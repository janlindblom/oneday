require "oneday"

describe "Oneday::Reader::Configuration" do
  
  before :each do
    @orc = Oneday::Reader::Configuration.new(file: "/tmp/oneday_test.conf")
  end
  
  it "throws Errno::EACCES if the configuration cannot be read from file" do
    @orc.file = "/tmp/nonexistant"
    expect {
      @orc.parse
    }.to raise_error(Errno::EACCES)
  end
  
  it "can write configuration to a file" do
    expect(File.exist? @orc.file).to eq(true)
    
    @orc.flush
  end

  it "can generate a default configuration" do
    @orc.default
    expect(@orc.config).to be_instance_of(ParseConfig)
    expect(@orc.config['default_storage_path']).not_to be_empty
    expect(@orc.config['default_storage_path']).to match(/Day\sOne/)
    expect(@orc.config.config_file).to be_nil
  end

  it "can read configuration from a file" do
    expect(@orc.file).not_to be_empty
    expect(File.exist?(@orc.file)).to eq(true)
    @orc.parse
    
    expect(@orc.config).to be_instance_of(ParseConfig)
    expect(@orc.config.config_file).not_to be_nil
  end
end