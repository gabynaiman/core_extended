module Marshal

  def self.encode64(object)
    Base64.encode64(dump(object))
  end

  def self.decode64(string)
    load(Base64.decode64(string))
  end

end