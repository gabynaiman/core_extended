class Hash

  Inflector = Struct.new :method, :arguments

  def self.inflectors
    @inflectors ||= []
  end

  def self.inflect(method, *args)
    inflectors << Inflector.new(method, args)
  end

  def self.inflections(key)
    [key.to_s, key.to_s.to_sym].tap do |list|
      inflectors.each do |i|
        k = key.to_s.send i.method, *i.arguments
        list.concat [k, k.to_sym]
      end
    end.uniq
  end

  def methods(*args)
    keys.flat_map{ |k| self.class.inflections(k).map(&:to_sym) }.uniq.concat(super)
  end

  def respond_to?(method, *args)
    super || methods.include?(method.to_sym)
  end

  def get(key)
    indiferent_access = [key, key.to_s, key.to_s.to_sym].uniq
    
    indiferent_access.each do |k|
      return self[k] if key?(k)
    end

    Hash[keys.map{ |k| [k, self.class.inflections(k)] }].each do |k,v|
      return self[k] if (v & indiferent_access).any?
    end

    nil
  end

  def method_missing(method, *args, &block)
    return get(method) if respond_to?(method.to_sym)
    super
  end

end