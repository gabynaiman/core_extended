# encoding: utf-8
require 'minitest_helper'

describe Extension::String do

  describe 'Upcase' do

    it 'With accents' do
      'áèïôu'.upcase.must_equal 'ÁÈÏÔU'
    end
    
    it 'Without accents'

    it 'Change itself'

  end

  describe 'Downcase' do
    
    it 'With accents'

    it 'Without accents'

    it 'Change itself'

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