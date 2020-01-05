class BooksController < ApplicationController
  
  def index
    @books = current_user.books.all
  end



  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def show
    @book = Book.find_by(id: params[:id])
  end

 def edit
   @book= Book.find_by(id: params[:id])
 end

 def update
    @book= Book.find_by(id: params[:id])
    if @book.update(book_params)
      redirect_to book_path, success:"更新しました"
    else
      flash.now[:danger]= "更新に失敗しました"
      render :edit
    end  
 end
 
 def destroy
    @book= Book.find_by(id: params[:id])
    @book.delete
    redirect_to books_path, success: "削除しました"
 end

  private
  def book_params
    params.require(:book).permit(:image, :description, :title, :genre)
  end
end