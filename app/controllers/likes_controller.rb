class LikesController < ApplicationController

  def like_action
    if signed_in?
      me_id = current_user.id
      post = Post.find(params[:id])
      new_like = Like.find_or_initialize_by(post_id: post.id, user_id: me_id)
      if new_like.persisted?
        new_like.destroy
      else
        new_like.save
        #Creando la notificacion
        Notification.create(recipient_id: post.user.id, actor: current_user, action: "liked", notifiable: post)
      end
    else
      redirect_to new_user_session_path
    end
  end

  def like_params
    params.require(:post).permit(:user_id, :post_id)
  end

end
