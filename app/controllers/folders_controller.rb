class FoldersController < ApplicationController
  def index
    @folders = current_user.folders.all
  end
  def show
  end
  def create
  end
  def update
  end
  def destroy
  end
end
