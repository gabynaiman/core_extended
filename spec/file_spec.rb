RbConfig::CONFIG['host_os'] = 'mswin'
require 'minitest_helper'

describe File do

  it 'Fix size for windows' do
    File.open(__FILE__, 'r') { |f| f.size.must_equal 183 }
  end

end