class ForumthreadSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :string, :category, :username, :userid
  has_one :user
end
