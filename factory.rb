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

      def values
        instance_variables.map { |arg| instance_variable_get("#{arg}") }
      end

      def ==(another)
        self.class == another.class && self.values == another.values 
      end

      def [](arg)
        arg.is_a?(Fixnum) ? instance_variable_get("@#{args[arg]}") : instance_variable_get("@#{arg}")
      end

      def []=(arg, val)
        arg.is_a?(Fixnum) ? instance_variable_set("@#{args[arg]}", val) : instance_variable_set("@#{arg}", val)
      end

      def length
        args.count
      end

      def select(&block)
        values.select { |v| yield(v) }
      end

      def each(&block)
        values.each { |v| yield(v) }
      end

      def each_pair(&block)
        args.each { |arg| yield(arg,send(arg)) }
      end
      
      class_eval(&block) if block_given?
    end
  end
end