class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :email, :created_at, :updated_at

  has_many :posts
  has_many :comments
end
