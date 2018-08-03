class BooksController < ApplicationController

  before_action :find_book, only: [:edit,:update,:destroy]
 
  def index
    @books = Book.all
  end
 
  def new
    @book = Book.new
  end
 
  def edit
   
  end
 
  def create
    @book = Book.new(book_params.merge(:user_id => current_user.id))
    if @book.save
      flash[:success] = "Successfully Created Book"
      redirect_to books_path
    else
      flash[:error] = @book.errors.full_messages.uniq.join(', ')
      redirect_to new_book_path
    end
  end
 
  def update
    book = @book.update_attributes(book_params)
    if proj
      flash[:success] = "Successfully Updated Book"
      redirect_to books_path
    else
      flash[:error] = @book.errors.full_messages.uniq.join(', ')
      redirect_to edit_book_path
    end
  end
 
  def destroy
    book = @book.destroy
    flash[:success] = "Successfully Deleted Book" if book
    flash[:error] = @book.errors.full_messages.uniq.join(', ') if !book
    redirect_to books_path
  end
 
  private
   
  def book_params
    params.require(:book).permit(:name,:author,:isbn,:price,:category,:publish_status,:user_id)
  end
 
  def find_book
    @book = Book.find_by_id(params[:id])
  end

end
