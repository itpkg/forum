module Forum
  class Tag < ApplicationRecord
    has_and_belongs_to_many :articles, class_name: 'Forum::Article'
  end
end
