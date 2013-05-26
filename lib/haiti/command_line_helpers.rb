require 'fileutils'
require 'open3'

module Haiti
  module CommandLineHelpers
    Invocation = Struct.new :stdout, :stderr, :status do
      def exitstatus
        status.exitstatus
      end
    end

    extend self

    def write_file(filename, body)
      in_proving_grounds do
        FileUtils.mkdir_p File.dirname filename
        File.open(filename, 'w') { |file| file.write body }
      end
    end

    def execute(command, stdin_data=nil)
      stdin_data ||= ''
      in_proving_grounds do
        with_bin_in_path do
          Invocation.new *Open3.capture3(command, stdin_data: stdin_data)
        end
      end
    end

    def in_proving_grounds(&block)
      Dir.chdir proving_grounds_dir, &block
    end

    def proving_grounds_dir
      config.proving_grounds_dir
    end

    def make_proving_grounds
      FileUtils.mkdir_p proving_grounds_dir
    end

    def bin_dir
      config.bin_dir
    end

    def path_to(filename)
      in_proving_grounds { File.join proving_grounds_dir, filename }
    end

    # workaround for Ruby 2.0 bug where passing the new path as the first arg wasn't working
    # bug report submitted here: http://bugs.ruby-lang.org/issues/8004
    def with_bin_in_path
      original_path = ENV['PATH']
      ENV['PATH'] = "#{bin_dir}:#{ENV['PATH']}"
      yield
    ensure
      ENV['PATH'] = original_path
    end

    def config
      Haiti.config
    end
  end
end
