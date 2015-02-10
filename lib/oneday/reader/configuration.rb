require "parseconfig"

module Oneday
  class Reader
    class Configuration
      attr_accessor :config, :file

      def initialize(args=nil)
        self.file = File.expand_path("~/.config/oneday.conf")
        unless args.nil?
          if args[:file]
            self.file = args[:file]
          end
        end

        initialize_configuration

        unless File.exist? self.file
          initialize_configuration_file
        end
      end

      def storage_path
        self.config['default_storage_path']
      end

      def parse
        self.config = ParseConfig.new(self.file)
        self.config
      end

      def flush
        f = File.open(self.file, 'w')
        status = self.config.write(f)
        f.close
        status
      end

      def default
        initialize_configuration
        self.config
      end

      private

      def initialize_configuration
        self.config = ParseConfig.new
        self.config.add("default_storage_path", File.expand_path("~/Dropbox/Apps/Day One/Journal.dayone"))
      end

      def initialize_configuration_file
        f = File.new(self.file, 'w')
        status = self.config.write(f)
        f.close
        status
      end

    end
  end
end