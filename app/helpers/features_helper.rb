module FeaturesHelper
	#Permite que el link del Like cambie de nombre
	def toggle_like_button(feature,user)
		if user.flagged?(feature)
			link_to "Unlike", like_feature_path(feature), :class => "buttonEdit"
		else
			link_to "Like", like_feature_path(feature), :class => "buttonEdit"
		end
	end
end
