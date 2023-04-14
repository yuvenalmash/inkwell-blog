class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :updated_at

  belongs_to :author, serializer: Api::V1::UserSerializer
  belongs_to :post
end
