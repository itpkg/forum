module Forum
  class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, class_name: 'Forum::Comment'
    has_and_belongs_to_many :tags, class_name: 'Forum::Tag'

    validates :user_id, :title, :body, presence: true
  end
end
