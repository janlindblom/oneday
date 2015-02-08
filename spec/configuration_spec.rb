require "oneday"

describe "Oneday::Reader::Configuration" do
  it "reads configuration from a file" do
    orc = Oneday::Reader::Configuration.new
    expect(File.exist?(orc.file)).to eq(true)

    orc.parse
    orc.store
  end
end