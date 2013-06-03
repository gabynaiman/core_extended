require 'minitest_helper'

describe Marshal do

  SERIALIZATION = "BAhvOgpLbGFzcwY6CUBzdHJJIhBoZWxsbyB3b3JsZAY6BkVG\n"

  class Klass
    def initialize(str)
      @str = str
    end
    def say_hello
      @str
    end
  end

  it 'Dump and encode base 64' do
    obj = Klass.new 'hello world'
    Marshal.encode64(obj).must_equal SERIALIZATION
  end

  it 'Decode base 64 and load' do
    obj = Marshal.decode64 SERIALIZATION
    obj.must_be_instance_of Klass
    obj.say_hello.must_equal 'hello world'
  end

end
