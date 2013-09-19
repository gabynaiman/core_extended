require 'minitest_helper'

describe Array do

  it 'Paginate' do
    array = (1..20).to_a
    paginator = array.page(2, 5)

    paginator.page.must_equal 2
    paginator.size.must_equal 5
    
    paginator.total.must_equal 20
    paginator.pages.must_equal 4
    
    paginator.wont_be :first?
    paginator.wont_be :last?

    paginator.to_a.must_equal_contents (6..10).to_a
  end

end