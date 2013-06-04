RbConfig::CONFIG['host_os'] = 'mswin'
require 'minitest_helper'

describe File do

  it 'Fix size for windows and jruby' do
    File.open(__FILE__, 'r') { |f| f.size.must_equal 193 }
  end

end