class Array

  def page(number, size=nil)
    Paginator.new self, page: number, size: size
  end

end