class FoldersController < ApplicationController
  def index
    @folders = current_user.folders.all
  end
  def show
    @folder = find_folder
  end
  def create
    save_folder current_user.folders.new(folder_params)
  end
  def update
    folder = find_folder
    folder.assign_attributes(folder_params)
    save_folder folder
  end
  def destroy
    folder = Folder.find_by(id: params[:id], user: current_user)
    if !!folder
      Folder.destroy(folder.id)
      render json: {success: true, message: "Folder: '#{folder.name}' deleted successfuly."}
    else
      render json: {message: "This isn't yours! O.o"}, status: :unauthorized
    end
  end
  private
  def folder_params
    params.require(:folder).permit(:name, :color)
  end
  def find_folder
    folder = Folder.find_by(id: params[:id], user: current_user)
    if !!folder
      folder
    else
      render json: {message: 'Folder not found'}, status: :not_found
    end
  end
  def save_folder(folder)
    if folder.valid?
      folder.save
      render json: {success: true, folder: folder}
    else
      render json: {success: false, messages: folder.errors.full_messages}
    end
  end
end
