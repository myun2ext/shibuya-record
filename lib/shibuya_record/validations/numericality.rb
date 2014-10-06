module ShibuyaRecord
  module Validations
    class Numericality
      #
      # format, greater_than, less_than, greater_than_or_equal_to
      # less_than_or_equal_to, equal_to
      def initialize(options = {})
        @options = options
      end

      def valid?(value)
        return numeric_validation(value) if value.is_a? Numeric

        if value.is_a? String
          return numeric_validation(value.to_i) if value =~ format
          return numeric_validation(value.to_f) if value =~ floating_format
        end

        false
      end

      private
      def format
        @options[:format] || /\A-?\d+\z/
      end
      def floating_format
        @options[:format] || /\A-?\d+(\.\d+)?\z/
      end

      def numeric_validation(value)
        if @options[:greater_than]
          return false unless value > @options[:greater_than]
        end
        if @options[:less_than]
          return false unless value < @options[:less_than]
        end
        if @options[:greater_than_or_equal_to]
          return false unless value >= @options[:greater_than_or_equal_to]
        end
        if @options[:less_than_or_equal_to]
          return false unless value <= @options[:less_than_or_equal_to]
        end
        if @options[:equal_to]
          return false unless value == @options[:equal_to]
        end
        true
      end
    end
  end
end
