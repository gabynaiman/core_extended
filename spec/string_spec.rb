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

    it 'Mixed' do
      'áEïÔu'.upcase.must_equal 'ÁEÏÔU'
    end

    it 'Change itself' do
      string = 'áèiÖU'
      string.upcase!.must_equal 'ÁÈIÖU'
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

    it 'Mixed' do
      'áEïÔu'.downcase.must_equal 'áeïôu'
    end

    it 'Change itself' do
      string = 'ÁÈIöu'
      string.downcase!.must_equal 'áèiöu'
      string.must_equal 'áèiöu'
    end

  end

  describe 'Unaccented' do

    it 'Transform keeping case' do
      string = 'Estas son mís létras MÁL acentúadäs y répetidâs íntëntândö ûtîlïzàr tôdas las varïantês'
      string.unaccented.must_equal 'Estas son mis letras MAL acentuadas y repetidas intentando utilizar todas las variantes'
      string.must_equal 'Estas son mís létras MÁL acentúadäs y répetidâs íntëntândö ûtîlïzàr tôdas las varïantês'
    end

    it 'Change itself' do
      string = 'áëÌôÛ'
      string.unaccented!.must_equal 'aeIoU'
      string.must_equal 'aeIoU'
    end
    
  end

  describe 'Normalized' do
    
    it 'Case and accents' do
      string = 'LétterS wÏth DifFèrent case ÂND Äccents'
      string.normalized.must_equal 'letters with different case and accents'
      string.must_equal 'LétterS wÏth DifFèrent case ÂND Äccents'
    end

    it 'Change itself' do
      string = 'SámPlÊ'
      string.normalized!.must_equal 'sample'
      string.must_equal 'sample'
    end

  end

end