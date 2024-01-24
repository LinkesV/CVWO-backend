class CommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :body, :userid, :postid, :created_at, :updated_at
  has_one :user
  has_one :forum_thread
end
