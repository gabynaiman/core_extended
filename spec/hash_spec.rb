require 'minitest_helper'

describe Hash do

  after do
    Hash.inflectors.clear
  end

  describe 'Without inflectors' do

    before do
      Hash.inflectors.clear
    end

    hash = {keyName1: 1, 'keyName2' => 2}

    it 'Inflections' do
      Hash.inflections('keyName').must_equal_contents ['keyName', :keyName]
    end

    it 'Get with indiferent access' do
      hash.get(:keyName1).must_equal 1
      hash.get('keyName1').must_equal 1

      hash.get(:keyName2).must_equal 2
      hash.get('keyName2').must_equal 2

      hash.get(:keyName3).must_be_nil
      hash.get('keyName3').must_be_nil
    end

    it 'Inflections for all keys' do
      hash.inflections.must_equal_contents [:keyName1, :keyName2]
    end

    it 'Key method accessors' do
      hash.keyName1.must_equal 1
      hash.keyName2.must_equal 2
      proc { hash.keyName3 }.must_raise NoMethodError
    end

  end

  describe 'With inflectors' do

    before do
      Hash.inflect :underscore
    end

    hash = {keyName1: 1, 'KeyName2' => 2, key_name3: 3}

    it 'Inflections' do
      Hash.inflections('keyName').must_equal_contents ['keyName', :keyName, 'key_name', :key_name]
    end

    it 'Get with indiferent access' do
      hash.get(:keyName1).must_equal 1
      hash.get('keyName1').must_equal 1
      hash.get(:key_name1).must_equal 1
      hash.get('key_name1').must_equal 1

      hash.get(:KeyName2).must_equal 2
      hash.get('KeyName2').must_equal 2
      hash.get(:key_name2).must_equal 2
      hash.get('key_name2').must_equal 2

      hash.get(:keyName3).must_be_nil
      hash.get('keyName3').must_be_nil
      hash.get(:key_name3).must_equal 3
      hash.get('key_name3').must_equal 3
    end

    it 'Inflections for all keys' do
      hash.inflections.must_equal_contents [:keyName1, :key_name1, :KeyName2, :key_name2, :key_name3]
    end

    it 'Key method accessors' do
      hash.keyName1.must_equal 1
      hash.key_name1.must_equal 1
      
      hash.KeyName2.must_equal 2
      hash.key_name2.must_equal 2
      
      proc { hash.keyName3 }.must_raise NoMethodError
      hash.key_name3.must_equal 3
    end

  end

  describe 'Dictionary' do

    it 'Simple hash' do
      hash = {key_1: 1, 'key_2' => 'text', key_3: []}
      hash.dictionary.must_equal 'key_1' => 1, 
                                 'key_2' => 'text', 
                                 'key_3' => []
    end

    it 'Nested hashes' do
      hash = {
        key_1: 1,
        'key_2' => 'text',
        key_3: [],
        key_4: {
          1 => '4.1',
          2 => {
            1 => '4.2.1',
            2 => '4.2.2'
          }
        }
      }

      hash.dictionary.must_equal 'key_1' => 1, 
                                 'key_2' => 'text', 
                                 'key_3' => [], 
                                 'key_4.1' => '4.1', 
                                 'key_4.2.1' => '4.2.1', 
                                 'key_4.2.2' => '4.2.2'
    end

  end

end