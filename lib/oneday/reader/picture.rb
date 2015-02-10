require "nokogiri"
require "oneday/reader/configuration"

module Oneday
  class Reader
    class Picture
      attr_accessor :id, :file, :entry

      def self.build(args)
        entry = Oneday::Reader::Picture.new
        entry.id = args[:id]
        entry.file = args[:file]
        return entry
      end
    end
  end
end