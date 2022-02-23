class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end
end