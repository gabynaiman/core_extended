require 'minitest_helper'

describe Paginator do

  array = (1..50).to_a

  it 'Defaults' do
    paginator = Paginator.new array

    paginator.page.must_equal 1
    paginator.size.must_equal 10
    
    paginator.total.must_equal 50
    paginator.pages.must_equal 5
    
    paginator.must_be :first?
    paginator.wont_be :last?

    paginator.to_a.must_equal_contents (1..10).to_a
  end

  it 'With arguments' do
    paginator = Paginator.new array, page: 3, size: 20

    paginator.page.must_equal 3
    paginator.size.must_equal 20
    
    paginator.total.must_equal 50
    paginator.pages.must_equal 3
    
    paginator.wont_be :first?
    paginator.must_be :last?

    paginator.to_a.must_equal_contents (41..50).to_a
  end

end