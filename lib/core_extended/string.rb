class String

  ACCENTS_MAPPING = ConfigReader.accents_mapping
  SIMILAR_CHARACTER_MAPPING = ConfigReader.similar_character_mapping

  alias_method :upcase_ignoring_accents!, :upcase!
  def upcase!
    ACCENTS_MAPPING.values.each { |map| tr! map['downcase'], map['upcase'] }
    upcase_ignoring_accents!
  end

  def upcase
    self.dup.tap(&:upcase!)
  end

  alias_method :downcase_ignoring_accents!, :downcase!
  def downcase!
    ACCENTS_MAPPING.values.each { |map| tr! map['upcase'], map['downcase'] }
    downcase_ignoring_accents!
  end

  def downcase
    self.dup.tap(&:downcase!)
  end
  
  def unaccented!
    ACCENTS_MAPPING.each do |letter,map|
      tr! map['upcase'], letter
      tr! map['downcase'], letter.downcase
    end
    nil
  end

  def unaccented
    self.dup.tap(&:unaccented!)
  end

  def letterize!
    SIMILAR_CHARACTER_MAPPING.each do |letter, similar_chars|
      tr! similar_chars, letter.to_s
    end
  end

  def letterize
    self.dup.tap(&:letterize!)
  end

  def normalized!
    self.strip!
    self.gsub! /\s/, '_'
    self.unaccented!
    self.letterize!
    self.downcase!
  end

  def normalized
    self.dup.tap(&:normalized!)
  end

  unless method_defined? :underscore
    def underscore
      self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end        
  end

  unless method_defined? :camelize
    def camelize(upper_case_first_letter=true)
      return self if self !~ /_/ && self =~ /[A-Z]+.*/
      if upper_case_first_letter
        split('_').map{|e| e.capitalize}.join
      else
        split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
      end
    end    
  end

end
