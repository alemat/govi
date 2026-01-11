module UsersHelper
  def user_avatar(user, options = {})
    width = options[:width] || 140
    height = options[:height] || 140
    css_class = options[:class] || 'img-profile-header-background profile-user-photo img-rounded'
    
    if user && user.photo.attached?
      image_tag user.photo.variant(resize_to_limit: [width, height]), 
                class: css_class, 
                width: width, 
                style: "width: #{width}px; height: #{height}px"
    else
      image_tag 'default_user.jpg', 
                class: css_class, 
                width: width, 
                style: "width: #{width}px; height: #{height}px"
    end
  end
  
  def online_status_tag(user)
    return unless user
    
    if user.online?
      content_tag(:span, "", class: "tt user-online-status user-is-online", 
                 title: "Online", data: { toggle: "tooltip", placement: "top" })
    else
      content_tag(:span, "", class: "tt user-online-status user-is-offline", 
                 title: "Offline", data: { toggle: "tooltip", placement: "top" })
    end
  end

  	# def online_status_tag(user)
	#     if user.online?
	#       content_tag(:span, "", class: "tt user-online-status user-is-online", 
	#                  title: "Online", data: { toggle: "tooltip", placement: "top" })
	#     else
	#       content_tag(:span, "", class: "tt user-online-status user-is-offline", 
	#                  title: "Offline", data: { toggle: "tooltip", placement: "top" })
	#     end
	# end
end
