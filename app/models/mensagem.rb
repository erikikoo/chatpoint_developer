class Mensagem < ApplicationRecord
  belongs_to :user

  validates :title, :email, :content, presence: true
end
