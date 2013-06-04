class OS

  def self.name
    RbConfig::CONFIG['host_os']
  end

  def self.linux?
    is? /linux/
  end

  def self.mac?
    is? /darwin|mac os/
  end

  def self.windows?
    is? /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  end

  def self.unix?
    is? /solaris|sunos|bsd/
  end

  def self.unknown?
    !linux? && !mac? && !windows? && !unix?
  end

  private

  def self.is?(regex)
    !regex.match(name).nil?
  end

end