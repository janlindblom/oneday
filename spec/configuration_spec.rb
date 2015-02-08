require "oneday"

describe Oneday::Reader::Configuration do
  it "reads configuration from a file" do
    orc = Oneday::Reader::Configuration.new
    puts orc.file
    orc.parse
    puts orc.config
    orc.store
  end
end