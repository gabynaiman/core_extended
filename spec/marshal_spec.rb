require 'minitest_helper'

describe Marshal do

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
    Marshal.encode64(obj).must_match %r(^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{4}|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)$)
  end

  it 'Decode base 64 and load' do
    serialization = Marshal.encode64(Klass.new('hello people'))
    obj = Marshal.decode64 serialization
    obj.must_be_instance_of Klass
    obj.say_hello.must_equal 'hello people'
  end

end
