class DocsController < ApplicationController
  def index
    @docs = current_user.docs.where("name LIKE ?", "%#{params[:search]}%")
  end
  def show
    @doc = Doc.find_by(id: params[:id], user: current_user)
  end
  def create
  end
  def update
  end
  def destroy
  end
end
