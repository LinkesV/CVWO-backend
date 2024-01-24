class ForumThreadSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :category, :username, :userid, :created_at, :updated_at
  has_one :user
end
