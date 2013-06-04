class File

  if OS.windows? && RUBY_PLATFORM == 'java'
    def size
      lstat.size
    end
  end

end