class FoldersController < ApplicationController
  def index
    @folders = current_user.folders.all
  end
  def show
    @folder = Folder.find_by(id: params[:id], user: current_user)
  end
  def create
    folder = current_user.folders.new(folder_params)
    save_folder folder
  end
  def update
    folder = Folder.find_by(id: params[:id], user: current_user)
    folder.assign_attributes(folder_params)
    save_folder folder
  end
  def destroy
  end
  private
  def folder_params
    params.require(:folder).permit(:name, :color)
  end
  def save_folder(folder)
    if folder.valid?
      folder.save
      render json: {success: true, message: "Folder '#{folder.name}' saved successfuly."}
    else
      render json: {success: false, messages: folder.errors.full_messages}
    end
  end
end
