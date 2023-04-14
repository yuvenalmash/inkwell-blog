class Api::V1::PostSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :text,
             :comments_counter,
             :likes_counter,
             :created_at,
             :updated_at

  belongs_to :user
  has_many :comments
end
