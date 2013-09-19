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

    it 'Methods for all keys' do
      hash.methods.must_include :keyName1
      hash.methods.must_include :keyName2
      hash.methods.wont_include :keyName3
    end

    it 'Respond to all keys' do
      hash.must_be :respond_to?, :keyName1
      hash.must_be :respond_to?, :keyName2
      hash.wont_be :respond_to?, :keyName3
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

    it 'Methods for all keys' do
      hash.methods.must_include :keyName1
      hash.methods.must_include :key_name1
      
      hash.methods.must_include :KeyName2
      hash.methods.must_include :key_name2
      
      hash.methods.wont_include :keyName3
      hash.methods.must_include :key_name3
    end

    it 'Respond to all keys' do
      hash.must_be :respond_to?, :keyName1
      hash.must_be :respond_to?, :key_name1
      
      hash.must_be :respond_to?, :KeyName2
      hash.must_be :respond_to?, :key_name2
      
      hash.wont_be :respond_to?, :keyName3
      hash.must_be :respond_to?, :key_name3
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

end