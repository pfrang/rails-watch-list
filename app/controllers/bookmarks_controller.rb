class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(strong_params)
    @bookmark.list_id = params[:list_id]
    if @bookmark.valid?
      @bookmark.save
      redirect_to list_path(params[:list_id])
    else
      # @bookmark = @bookmark.errors.full_messages
      # redirect_to new_list_bookmark_path(params[:list_id])
      render :new
    end
  end

  private

  def strong_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
