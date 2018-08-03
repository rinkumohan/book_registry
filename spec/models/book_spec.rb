require 'rails_helper'

RSpec.describe Book, type: :model do
  
  context 'validation tests' do
     
      it 'ensures name presence' do
        book = Book.new(author: 'user',isbn: 201803,user_id: 1,price: 1222,category: 'new_books',publish_status: false).save
        expect(book).to eq(false)
      end
    
      it 'ensures author presence' do
        book = Book.new(book_name: 'abcdef',isbn: 201803,user_id: 1,price: 1222,category: 'new_books',publish_status: false).save
        expect(book).to eq(false)
      end
    
      it 'ensures isbn presence' do
        book = Book.new(book_name: 'abcdef',author: 'user3',user_id: 1,price: 1222,category: 'new_books',publish_status: false).save
        expect(book).to eq(false)
      end
    
      it 'ensures price presence' do
        book = Book.new(book_name: 'abcdef',author: 'user3',user_id: 1,isbn: 1222,category: 'new_books',publish_status: false).save
        expect(book).to eq(false)
      end
    
      it 'ensures category presence' do
        book = Book.new(book_name: 'abcdef',author: 'user3',user_id: 1,isbn: 1222,price: 332,publish_status: false).save
        expect(book).to eq(false)
      end
    
      it 'should save succesfully' do
        book = Book.new(book_name: 'abcdef',author: 'user3',user_id: 1,isbn: 1222,category: 'new_books',price: 886,publish_status: true).save
        expect(book).to eq(true)
      end
  
  end

end
