class DocsController < ApplicationController
  def index
    @docs = current_user.docs.where("name LIKE ?", "%#{params[:search]}%")
  end
  def show
    @doc = find_doc
  end
  def create
  end
  def update
  end
  def destroy
  end
  private
  def doc_params

  end
  def find_doc
    doc = Doc.find_by(id: params[:id])
    if !doc
      render json: {message: 'Doc not found'}, status: :not_found
    else
      if !!doc.shared

      else
        if doc.user == current_user
          doc
        else
          render json: {message: 'Doc not found'}, status: :unauthorized
        end
      end
    end
  end
end
