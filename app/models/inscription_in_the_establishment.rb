class InscriptionInTheEstablishment < ApplicationRecord
  belongs_to :user_perfil, optional: true
  belongs_to :client, optional: true
end
