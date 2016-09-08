require 'elasticsearch/model'

module Forum
  class Tag < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    has_and_belongs_to_many :articles, class_name: 'Forum::Article'

    validates :name, presence: true, uniqueness: true
  end
end
