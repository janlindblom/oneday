require "parseconfig"

module Oneday
  class Reader
    class Configuration
      attr_accessor :config, :file

      def initialize(args=nil)
        file = File.expand_path("#{ENV['HOME']}/.config/oneday.conf")
        unless args.nil?
          if args[:file]
            file = args[:file]
          end
        end

        unless File.exist? file
          initialize_configuration_file
        end
      end

      def parse
        raise file.inspect
        config = ParseConfig.new(file)
        config
      end

      def store
        f = File.open(file, 'w')
        status = config.write(f)
        f.close
        status
      end

      private

      def initialize_configuration_file
        config = ParseConfig.new
        config.add("default_storage_path", "~/Dropbox/Apps/Day One/Journal.dayone")
        f = File.new(file, 'w')
        status = config.write(f)
        f.close
        status
      end

    end
  end
end