class SharesController < ApplicationController
  def create
    doc = Doc.find_by(id: params[:id], user: current_user)
    user = User.find(params[:user_id])
    share = Share.new(doc: doc, user: user)
    if share.valid? && !!user && user != current_user && !!doc
      share.save
      render json: {success: true, message: "document shared with #{user.username}"}
    else
      render json: {success: false, message: "Something went wrong."}
    end
  end
end
