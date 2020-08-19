class DocsController < ApplicationController
  def index
    @docs = current_user.docs.where("name LIKE ?", "%#{params[:search]}%")
  end
  def show
    @doc = find_doc
  end
  def create
    save_doc current_user.docs.new(doc_params)
  end
  def update
  end
  def destroy
  end
  private
  def doc_params
    params.require(:doc).permit(:name, :body, :shared, :folder_id)
  end
  def find_doc
    doc = Doc.find_by(id: params[:id])
    if !doc
      render json: {message: 'Doc not found'}, status: :not_found
    else
      if !!doc.shared
        share = Share.find_by(doc: doc, user: current_user)
        if !!share
          doc
        else
          render json: {message: 'You do not have access to this doc, you need to request access from the owner.'}, status: :unauthorized
        end
      else
        if doc.user == current_user
          doc
        else
          render json: {message: 'You do not have access to this doc.'}, status: :unauthorized
        end
      end
    end
  end
  def save_doc(doc)
    if doc.valid?
      doc.save
      render json: {success: true, message: "Doc: '#{doc.name}' saved successfully."}
    else
      render json: {success: false, messages: doc.errors.full_messages}
    end
  end
end
