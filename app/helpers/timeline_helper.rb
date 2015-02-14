module TimelineHelper

  def tweets_link
    from_user_path(user_on_page.id) if user_on_page
  end

  def tweets_count
    Message.where(user_id: user_on_page.id).count if user_on_page
  end

  def followers_link
    followers_path(user_on_page.id) if user_on_page
  end

  def followed_link
    followed_path(user_on_page.id) if user_on_page
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

  def choose_class(path)
    if action_name.match path
      "active"
    else
      ""
    end
  end
end