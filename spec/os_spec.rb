require 'minitest_helper'

describe OS do

  def stub_os(name)
    RbConfig::CONFIG['host_os'] = name
  end

  it 'Linux' do
    stub_os 'linux-gnu'
    OS.must_be :linux?
  end

  it 'Mac' do
    ['darwin', 'mac os'].each do |name|
      stub_os name
      OS.must_be :mac?
    end
  end

  it 'Windows' do
    %w(mswin msys mingw cygwin bccwin wince emc).each do |name|
      stub_os name
      OS.must_be :windows?
    end
  end

  it 'Unix' do
    %w(solaris sunos bsd).each do |name|
      stub_os name
      OS.must_be :unix?
    end
  end

  it 'Unkonw' do
    stub_os 'invalid_so'
    OS.must_be :unknown?
  end

end
