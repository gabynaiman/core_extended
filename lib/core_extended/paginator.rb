class Paginator

  include Enumerable

  attr_reader :page, :size

  def initialize(collection, options={})
    @collection = collection
    @page = options[:page] ? options[:page].to_i : 1
    @size = options[:size] ? options[:size].to_i : 10
  end

  def each(&block)
    from = size * (page - 1)
    (@collection.slice(from, size) || []).each(&block)
  end

  def total
    @collection.count
  end

  def pages
    (total / size.to_f).ceil
  end

  def first?
    page == 1
  end

  def last?
    page == pages
  end

end