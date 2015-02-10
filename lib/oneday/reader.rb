require "oneday/reader/configuration"
require "oneday/reader/entry"

module Oneday
  class Reader
    attr_accessor :configuration

    # Will initialize the Oneday::Reader.
    def initialize(args=nil)
      self.configuration = Oneday::Reader::Configuration.new
      if !args.nil? && args['config_file']
        self.configuration = Oneday::Reader::Configuration.new(args['config_file'])
      end
      self.configuration.parse
    end

    # Will list existing entries based on the configured storage path.
    def entries
      path = File.expand_path("#{self.configuration.storage_path}/entries")
      files = Dir.glob(File.join(path, "*.doentry")).map { |filename|
        Oneday::Reader::Entry.build({
          id: filename.match(/\/.*\/(.*)\.doentry$/)[1],
          file: filename}) }.to_a
      files
    end

    # Will list pictures based on the configured storage path.
    def pictures
      path = File.expand_path("#{self.configuration.storage_path}/photos")
      files = Dir.glob(File.join(path, "*.*")).map { |filename|
        Oneday::Reader::Entry.build({
          id: filename.match(/\/.*\/(.*)\..*$/)[1],
          file: filename,
          entry: filename.match(/\/.*\/(.*)\..*$/)[1]}) }.to_a
      files
    end

    # Will open a given entry.
    def open(entry=nil)
    end

  end
end