require "nokogiri"
require "oneday/reader/configuration"

module Oneday
  class Reader
    class Entry
      attr_accessor :id, :file

      def self.build(args)
        entry = Oneday::Reader::Entry.new
        entry.id = args[:id]
        entry.file = args[:file]
        #entry.populate_from_file
        return entry
      end

      def populate_from_file
        f = File.open(self.file)
        doc = Nokogiri::XML(f)
        #doc.xpath("/plist//dict/key/following-sibling/plist/dict[key='Tracks']/dict/dict/key[.='Name']/following-sibling::string[1]")
        f.close
        raise doc.inspect
      end

    end
  end
end