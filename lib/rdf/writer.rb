module RDF
  class Writer
    ##
    # Writes output to the given `gzip_filename`.
    #
    # @param [String, #to_s] gzip_filename
    # @param [Hash{Symbol => Object}] options
    # any additional options (see {RDF::Writer#initialize} and {RDF::Format.for})
    # @option options [Symbol] :format (nil)
    # @return [RDF::Writer]
    def self.gzopen(gzip_filename, options = {}, &block)
      Zlib::GzipWriter.open(gzip_filename) do |file|
        format_options = options.dup
        format_options[:file_name] ||= gzip_filename
        self.for(options[:format] || format_options).new(file, options, &block)
      end
    end
  end    
end