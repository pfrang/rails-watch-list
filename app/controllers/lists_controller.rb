class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: params[:id])
    @movies = []
    @bookmarks.each do |movie|
      @movies << Movie.find(movie.movie_id)
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.valid?
      @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end


  def strong_params
    params.require(:list).permit(:name)
  end



end
