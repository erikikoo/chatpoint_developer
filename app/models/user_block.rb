class UserBlock < ApplicationRecord
 belongs_to :user_perfil, optional: true 
end
