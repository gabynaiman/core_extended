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

  describe 'Normalized' do

    it 'Downcase' do
      'AeIoU'.normalized.must_equal 'aeiou'
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

end
