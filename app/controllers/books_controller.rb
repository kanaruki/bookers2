class BooksController < ApplicationController

  before_action :authenticate_user!
  def new
  @book = Book.new
  end

def create
   @book = Book.new(book_params)
   @book.user_id=current_user.id
   if@book.save
    redirect_to book_path(@book)
   else
   @user = current_user
   @books = Book.all
    render action: :index
   end
   flash[:notice] = "successfully"
end
  def show
     @book = Book.new
     @bookf = Book.find(params[:id])
     @user =  @bookf.user
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  def update
    @bookf = Book.find(params[:id])
    if@bookf.update(book_params)
     redirect_to book_path(@bookf)
    else
      render action: :edit
    end
    flash[:notice] = "successfully"
  end

  def edit
    @book = Book.new
    @bookf = Book.find(params[:id])
    if@bookf.user==current_user
     render :edit
    else
     redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end