require 'test_helper'

class BookTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "book save" do
       book = Book.new({
           isbn: '978-4-7741-4466-X',
           title: 'Ruby on Rails',
           price: 3100,
           publish: '技術評論社',
           published: '2014-02-14',
           cd: false,
       })
       assert book.save, 'Failed to save'
   end

   test "book validate" do
       book = Book.new({
           isbn: '978-4-7741-4466-X',
           title: 'Ruby on Rails',
           price: 11000,
           publish: '技術評論社',
           published: '2014-02-14',
           cd: false,
       })
       assert !book.save, 'Failed to validate'
       assert_equal 1, book.errors.size, 'Failed to validate count'
       assert book.errors[:price].any?, 'Failed to price validate'
   end
end
