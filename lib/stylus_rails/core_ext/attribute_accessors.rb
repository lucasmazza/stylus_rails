# Similar implementation to the ActiveSupport core extension.
# https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/module/attribute_accessors.rb
class Module

  def mattr_accessor(sym)
    class_eval(<<-EOS, __FILE__, __LINE__ + 1)
      @@#{sym} = nil unless defined? @@#{sym}

      def self.#{sym}
        @@#{sym}
      end

      def self.#{sym}=(obj)
        @@#{sym} = obj
      end
    EOS
  end
end