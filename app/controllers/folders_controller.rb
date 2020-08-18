class FoldersController < ApplicationController
  def index
    @folders = current_user.folders.all
  end
  def show
    @folder = Folder.find_by(id: params[:id], user: current_user)
  end
  def create
  end
  def update
  end
  def destroy
  end
end
