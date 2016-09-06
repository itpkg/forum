module Forum
  class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :article, class_name: 'Forum::Article'

    validates :user_id, :article_id, :body, presence: true
  end
end
