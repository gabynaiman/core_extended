# encoding: utf-8
module Extension
  module String

    ACCENTS_MAPPING = [
      {letter: 'A', upcase: 'ÁÀÄÂ', downcase: 'áàäâ'},
      {letter: 'E', upcase: 'ÉÈËÊ', downcase: 'éèëê'},
      {letter: 'I', upcase: 'ÍÌÏÎ', downcase: 'íìïî'},
      {letter: 'O', upcase: 'ÓÒÖÔ', downcase: 'óòöô'},
      {letter: 'U', upcase: 'ÚÙÜÛ', downcase: 'úùüû'}
    ]

    def self.included(klass)
      klass.class_eval do
        include InstanceMethods
      end


      #klass.send :alias_method, :__upcase, :upcase
      #klass.send :alias_method, :__downcase, :downcase

      #klass.send :include, InstanceMethods

    end

    module InstanceMethods

      def upcase
      end

      def upcase!
      end

      def downcase
      end

      def downcase!
      end

      def unaccented
        self.dup.unaccented!
      end

      def unaccented!
        ACCENTS_MAPPING.inject(self) do |string, map|
          string.tr! map[:upcase], map[:letter]
          string.tr! map[:downcase], map[:letter].downcase
          string
        end
      end

      def normalized
        self.dup.normalized!
      end

      def normalized!
        self.unaccented!.downcase!
      end

    end

  end
end

String.send :include, Extension::String

class String

  def upcase
  end

end