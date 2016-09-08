require 'elasticsearch/model'

module Forum
  class Article < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    def as_indexed_json(options={})
      as_json(expect: [:title, :body])
    end

    belongs_to :user
    has_many :comments, class_name: 'Forum::Comment'
    has_and_belongs_to_many :tags, class_name: 'Forum::Tag'

    validates :user_id, :title, :body, presence: true

    def summary
      body[0..200]
    end
  end
end
