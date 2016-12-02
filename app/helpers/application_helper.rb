module ApplicationHelper
	def get_avatar(user, perfil) 
		if perfil == 'chat'	
			if user.avatar.present?
				image_tag(user.avatar.url(:thumbnail), :class => 'img-rounded', :width=>45, :height=>50, :gravity=>"face", :radius=>"max", :crop=>"thumb", :background=>'#29706C')
			else
				cl_image_tag("avatar-default_t3b9yz.jpg", :class => 'img-rounded', :width=>50, :height=>50, :gravity=>"face", :radius=>"max", :crop=>"thumb", :background=>'#29706C')
			end
		elsif perfil == 'form'	
			if user.avatar.present?
				image_tag(user.avatar.url(:thumbnail), :class => 'img-rounded', :width=>200, :height=>200, :gravity=>"face", :radius=>"max", :crop=>"thumb")
			else
				cl_image_tag("avatar-default_t3b9yz.jpg", :class => 'img-rounded', :width=>200, :height=>200, :gravity=>"face", :radius=>"max", :crop=>"thumb")
			end
		elsif perfil == 'chat_index'	
			if user.avatar.present?
				image_tag(user.avatar.url(:thumbnail), :class => 'img-rounded', :width=>40, :height=>50, :gravity=>"face", :radius=>"max", :crop=>"thumb")
			else
				cl_image_tag("avatar-default_t3b9yz.jpg", :class => 'img-rounded', :width=>50, :height=>50, :gravity=>"face", :radius=>"max", :crop=>"thumb")
			end
		end	
	end	
	
	def readSexo(s)
		if s.eql?('m')
			'Masculino'
		else
			'Feminino'
		end		
	end

	def calcIdade(i)		
		nasc =  Date.today.year - i
		if nasc < 1
		 	nasc.to_s + " ano"
		 elsif nasc 	> 1
		 	nasc.to_s + ' anos'
		 end	
	end
end
