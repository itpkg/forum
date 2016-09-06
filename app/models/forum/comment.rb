module Forum
  class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :article, class_name: 'Forum::Article'
  end
end
