# encoding: utf-8
require 'minitest_helper'

describe String do

  describe 'Upcase' do

    it 'Only accented' do
      'áÈïÔú'.upcase.must_equal 'ÁÈÏÔÚ'
    end

    it 'Without accents' do
      'aEiOu'.upcase.must_equal 'AEIOU'
    end

    it 'ñ' do
      'ñ'.upcase.must_equal 'Ñ'
    end

    it 'Keep itself' do
      string = 'áèiÖU'
      string.upcase.must_equal 'ÁÈIÖU'
      string.must_equal 'áèiÖU'
    end

    it 'Change itself' do
      string = 'áèiÖU'
      string.upcase!
      string.must_equal 'ÁÈIÖU'
    end

  end

  describe 'Downcase' do

    it 'Only accented' do
      'áÈïÔú'.downcase.must_equal 'áèïôú'
    end

    it 'Without accents' do
      'aEiOu'.downcase.must_equal 'aeiou'
    end

    it 'Ñ' do
      'Ñ'.downcase.must_equal 'ñ'
    end

    it 'Keep itself' do
      string = 'áèiÖU'
      string.downcase.must_equal 'áèiöu'
      string.must_equal 'áèiÖU'
    end

    it 'Change itself' do
      string = 'ÁÈIöu'
      string.downcase!
      string.must_equal 'áèiöu'
    end

  end

  describe 'Unaccented' do

    it 'Transform keeping case' do
      'LétterS wÏth DifFèrent câse ÂND Äccents'.unaccented.must_equal 'LetterS wIth DifFerent case AND Accents'
    end

    it 'Keep itself' do
      string = 'áëÌôÛ'
      string.unaccented.must_equal 'aeIoU'
      string.must_equal 'áëÌôÛ'
    end

    it 'Change itself' do
      string = 'áëÌôÛ'
      string.unaccented!
      string.must_equal 'aeIoU'
    end

  end

  describe 'Letterize' do
    
    it 'Transform all similar letters' do
      ConfigReader.similar_character_mapping.each do |letter, similar_chars|
        similar_chars.chars.each do |char| 
          char.letterize.must_equal letter
        end
      end
    end
    
    it 'Transform keeping case' do
      'ßΔЯƦą'.letterize.must_equal 'BARRa'
    end

    it 'Keep itself' do
      string = 'ßΔЯƦą'
      string.letterize.must_equal 'BARRa'
      string.must_equal 'ßΔЯƦą'
    end

    it 'Change itself' do
      string = 'ßΔЯƦą'
      string.letterize!
      string.must_equal 'BARRa'
    end  
  end
    
  describe 'Normalized' do

    it 'Downcase' do
      'AeIoUÑ'.normalized.must_equal 'aeiouñ'
    end

    it 'Remove accents' do
      'áèïôu'.normalized.must_equal 'aeiou'
    end

    it 'Replace spaces with underscore' do
      'this is a sample'.normalized.must_equal 'this_is_a_sample'
    end

    it 'Strip' do
      '  text   '.normalized.must_equal 'text'
    end

    it 'Keep itself' do
      string = 'LétterS wÏth DifFèrent câse ÂND Äccents'
      string.normalized.must_equal 'letters_with_different_case_and_accents'
      string.must_equal 'LétterS wÏth DifFèrent câse ÂND Äccents'
    end

    it 'Change itself' do
      string = 'LétterS wÏth DifFèrent câse ÂND Äccents'
      string.normalized!
      string.must_equal 'letters_with_different_case_and_accents'
    end

  end

  describe 'Underscore' do

    it 'Camel case' do
      'CamelCase'.underscore.must_equal 'camel_case'
    end

    it 'Camel case start with downcase' do
      'camelCase'.underscore.must_equal 'camel_case'
    end

    it 'Lower case' do
      'lowercase'.underscore.must_equal 'lowercase'
    end

    it 'Upper case' do
      'UPPERCASE'.underscore.must_equal 'uppercase'
    end

  end

  describe 'Camelize' do

    it 'Underscore' do
      'under_score'.camelize.must_equal 'UnderScore'
    end

    it 'Underscore convert staring with downcase' do
      'under_score'.camelize(false).must_equal 'underScore'
    end

    it 'Lower case' do
      'lowercase'.camelize.must_equal 'Lowercase'
    end

    it 'Upper case' do
      'UPPERCASE'.camelize.must_equal 'UPPERCASE'
    end

  end

end
