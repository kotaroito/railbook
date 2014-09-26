class AddIndexToBooks < ActiveRecord::Migration
  def change
      add_index :books, [:publish, :published], name: 'idx_publish_published'
  end
end
