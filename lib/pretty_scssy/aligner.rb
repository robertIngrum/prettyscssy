module PrettyScssy
  class Aligner
    def self.run
      new.run
    end

    def run
      file_paths.each { |f| align(f) }
    end

    private

    def file_paths
      @files ||= Dir[Rails.root.join('app/assets/stylesheets/**/*.scss')]
    end

    def align(file_path)
      announce_file(file_path)

      Document.new(file_path).beautify
    end

    def announce_file(file_path)
      p "Running for #{file_path}"
    end
  end
end
