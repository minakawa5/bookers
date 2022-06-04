class BooksController < ApplicationController
  def new
   @book = Book.new
  end
   
   def create
    @book = Book.new(list_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end  
  end
 
  def index
   @book = Book.new
   
   @books = Book.all
  end
  
  def show
   @book = Book.find(params[:id])    
  end
  
  def edit
   @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
   if @book.update(list_params)
    redirect_to book_path(@book.id)
   else
    render :new
    end
   end
  
   def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:book).permit(:title, :body)
  end
  
end
