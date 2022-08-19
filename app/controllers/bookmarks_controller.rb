class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy 
    @list = @bookmark.list
    redirect_to list_path(@list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
