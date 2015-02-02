module TimelineHelper

  def tweets_link
    if params[:id].present?
      from_user_path(params[:id])
    else
      from_user_path(current_user.id)
    end
  end

  def tweets_count
    if params[:id].present?
      Message.where(user_id: params[:id]).count
    else
      Message.where(user_id: current_user).count
    end
  end

  def followers_link
    if params[:id].present?
      followers_path(params[:id])
    else
      followers_path(current_user.id)
    end
  end

  def followed_link
    if params[:id].present?
      followed_path(params[:id])
    else
      followed_path(current_user.id)
    end
  end    

  def user_on_page
    if params[:id].present?
      @user_on_page ||= User.find(params[:id])
    else
      @user_on_page ||= current_user
    end
  end

  def followed_count
     Following.where(:user_id => user_on_page).count
  end

  def followers_count
    Following.where(:followed_user_id => user_on_page).count
  end

  def show_follow_unfollow_link?
    if current_user.id.to_s == params[:id] || params[:id].blank?
      false
    else
      true
    end
  end
  
  def follow_unfollow_link
    if Following.where(user_id: current_user.id, followed_user_id: params[:id])[0]
      link_to "Unfollow", unfollow_path(params[:id]), method: :delete
    else
      link_to "Follow", follow_path(params[:id]), method: :post
    end
  end
end