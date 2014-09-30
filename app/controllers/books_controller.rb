class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :destroy]
  
  # GET /books
  # GET /books.json
  def index
      @books = Book.includes(:authors).all

#      logger.info config.active_record.inspect
      logger.info Railbook::Application.config.autoload_paths
  end

  def recent
      two_years_ago = (Time.now - 2 * 365 * 86400).strftime('%Y-%m-%d')
      @books = Book.where('published > ?', two_years_ago).order(published: :desc)
  end

  def publisher
      @books = Book.publisher(params[:publisher])
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    Book.transaction(isolation: :repeatable_read) do
        @book = Book.find(params[:id])
        respond_to do |format|
          if @book.update(book_params)
            format.html { redirect_to @book, notice: 'Book was successfully updated.' }
            format.json { render :show, status: :ok, location: @book }
          else
            format.html { render :edit }
            format.json { render json: @book.errors, status: :unprocessable_entity }
          end
        end
    end
  rescue => e
      render text: e.message
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :price, :publish, :published, :cd, :lock_version)
    end
end
