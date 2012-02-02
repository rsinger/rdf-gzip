module RDF
  class Reader
    ##
    # Parses input from the given gzip file name or URL.
    #
    # @param [String, #to_s] filename
    # @param [Hash{Symbol => Object}] options
    # any additional options (see {RDF::Reader#initialize} and {RDF::Format.for})
    # @option options [Symbol] :format (:ntriples)
    # @yield [reader]
    # @yieldparam [RDF::Reader] reader
    # @yieldreturn [void] ignored
    # @raise [RDF::FormatError] if no reader found for the specified format
    def self.gzopen(filename, options = {}, &block)
      Util::File.open_gzipfile(filename, options) do |file|
        format_options = options.dup
        format_options[:content_type] ||= file.content_type if file.respond_to?(:content_type)
        format_options[:file_name] ||= filename
        reader = self.for(format_options[:format] || format_options) do
          # Return a sample from the input file
          sample = file.read(1000)
          file.rewind
          sample
        end
        if reader
          reader.new(file, options, &block)
        else
          raise FormatError, "unknown RDF format: #{format_options.inspect}"
        end
      end
    end  
  end
end