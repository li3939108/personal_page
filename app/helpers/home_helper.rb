module HomeHelper
	def cmt(t)
		content_tag(:span, "//#{t}", {'class' => 'comments'})
	end
end
