require 'minitest_helper'

describe File do

  windows_method = OS.method(:windows?) 
  jruby_method = Ruby.method(:jruby?) 

  after do
    OS.define_singleton_method :windows?, &windows_method
    Ruby.define_singleton_method :jruby?, &jruby_method
  end

  it 'Fix size for windows and jruby' do
    OS.define_singleton_method(:windows?) { true }
    Ruby.define_singleton_method(:jruby?) { true }

    File.open("#{File.dirname(__FILE__)}/../LICENSE.txt", 'r') { |f| f.size.must_equal 1071 }
  end

  it 'Default size for other platforms' do
    File.open("#{File.dirname(__FILE__)}/../LICENSE.txt", 'r') { |f| f.size.must_equal 1071 }
  end

end