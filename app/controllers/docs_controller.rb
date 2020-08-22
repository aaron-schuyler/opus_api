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

    doc = find_doc
    doc.assign_attributes(doc_params)
    save_doc doc
  end
  def destroy
    doc = Doc.find_by(id: params[:id], user: current_user)
    if !!doc
      Doc.destroy(doc.id)
      render json: {success: true, message: "Doc: '#{doc.name}' deleted successfuly."}
    else
      render json: {message: "This isn't yours! O.o"}, status: :unauthorized
    end
  end
  private
  def doc_params
    params.require(:doc).permit(:name, :shared, :folder_id, :exerp, :body => {})
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
      render json: {success: true, doc: doc}
    else
      render json: {success: false, messages: doc.errors.full_messages}
    end
  end
end
