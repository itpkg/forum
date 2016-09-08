require 'elasticsearch/model'

module Forum
  class Comment < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    belongs_to :user
    belongs_to :article, class_name: 'Forum::Article'

    validates :user_id, :article_id, :body, presence: true
  end
end
