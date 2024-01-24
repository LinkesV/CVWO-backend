class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :username, :userid
  has_one :user
end
