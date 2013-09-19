require 'minitest_helper'

describe Ruby do
  
  it 'Engine' do
    Ruby.engine.must_equal RUBY_ENGINE
  end

  it 'Platform' do
    Ruby.platform.must_equal RUBY_PLATFORM
  end

  it 'Version' do
    Ruby.version.must_equal RUBY_VERSION
  end

  it 'MRI' do
    Ruby.mri?.must_equal RUBY_ENGINE == 'ruby'
  end

  it 'JRuby' do
    Ruby.jruby?.must_equal RUBY_ENGINE == 'jruby'
  end

end