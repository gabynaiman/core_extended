class File

  alias_method :__size__, :size
  def size
    return lstat.size if OS.windows? && Ruby.jruby?
    __size__
  end

end