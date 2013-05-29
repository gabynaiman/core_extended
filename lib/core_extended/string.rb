# encoding: utf-8
class String

  ACCENTS_MAPPING = [
    {letter: 'A', upcase: 'ÁÀÄÂ', downcase: 'áàäâ'},
    {letter: 'E', upcase: 'ÉÈËÊ', downcase: 'éèëê'},
    {letter: 'I', upcase: 'ÍÌÏÎ', downcase: 'íìïî'},
    {letter: 'O', upcase: 'ÓÒÖÔ', downcase: 'óòöô'},
    {letter: 'U', upcase: 'ÚÙÜÛ', downcase: 'úùüû'}
  ]

  alias_method :upcase_ignoring_accents!, :upcase!
  def upcase!
    ACCENTS_MAPPING.inject(self) do |string, map|
      string.tr! map[:downcase], map[:upcase]
      string
    end.upcase_ignoring_accents!
  end

  def upcase
    self.dup.upcase!
  end

  alias_method :downcase_ignoring_accents!, :downcase!
  def downcase!
    ACCENTS_MAPPING.inject(self) do |string, map|
      string.tr! map[:upcase], map[:downcase]
      string
    end.downcase_ignoring_accents!
  end

  def downcase
    self.dup.downcase!
  end
  
  def unaccented!
    ACCENTS_MAPPING.inject(self) do |string, map|
      string.tr! map[:upcase], map[:letter]
      string.tr! map[:downcase], map[:letter].downcase
      string
    end
  end

  def unaccented
    self.dup.unaccented!
  end

  def normalized!
    self.unaccented!.downcase!
  end

  def normalized
    self.dup.normalized!
  end

end
