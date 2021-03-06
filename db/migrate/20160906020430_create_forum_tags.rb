class CreateForumTags < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_tags do |t|
      t.string :name, null:false, unique:true
      t.integer :rate, null: false, default: 0
      t.timestamps
    end

    create_table :forum_articles_tags, id: false do |t|
      t.belongs_to :article, index: true
      t.belongs_to :tag, index: true
    end
  end
end
