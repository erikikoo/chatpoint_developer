module AdminHelper

	def status(a)
		if a
			return raw("<i class='text-success glyphicon glyphicon-ok'></i>" )
		else
			raw("<i class='text-danger glyphicon glyphicon-remove'></i>" )
		end
	end
end
