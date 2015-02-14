module MessagesHelper

  def user_wrote_link(message)
    if message.user.username.present?
      text = "#{message.user.username} wrote:"
    else
      text = "#{message.user.email} wrote:"
    end

    link_to text, from_user_path(message.user)   
  end
end