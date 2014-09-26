class AddLockVersionToBooks < ActiveRecord::Migration
  def change
      add_column :books, :lock_version, :integer, default: 0
  end
end
