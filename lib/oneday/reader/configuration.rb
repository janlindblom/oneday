require "parseconfig"

module Oneday
  class Reader
    class Configuration
      attr_accessor :config, :file

      def initialize(args=nil)
        self.file = File.expand_path("#{ENV['HOME']}/.config/oneday.conf")
        unless args.nil?
          if args[:file]
            self.file = args[:file]
          end
        end

        unless File.exist? self.file
          initialize_configuration_file
        end
      end

      def parse
        self.config = ParseConfig.new(self.file)
        self.config
      end

      def store
        f = File.open(self.file, 'w')
        status = self.config.write(f)
        f.close
        status
      end

      private

      def initialize_configuration_file
        self.config = ParseConfig.new
        self.config.add("default_storage_path", "~/Dropbox/Apps/Day One/Journal.dayone")
        f = File.new(self.file, 'w')
        status = self.config.write(f)
        f.close
        status
      end

    end
  end
end