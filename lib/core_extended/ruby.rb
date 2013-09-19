class Ruby
  
  def self.engine
    RUBY_ENGINE
  end

  def self.platform
    RUBY_PLATFORM
  end

  def self.version
    RUBY_VERSION
  end

  def self.mri?
    engine == 'ruby'
  end

  def self.jruby?
    engine == 'jruby'
  end

end