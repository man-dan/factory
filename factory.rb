class Factory
  def self.new (*args, &block)
    Class.new do
      
      attr_accessor(*args)

      def initialize(*vals)
        args.each_index { |i| instance_variable_set(:"@#{args[i]}", vals[i]) }
      end

      define_method :args do
        args
      end

    end
  end
end