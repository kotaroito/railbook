class ChangeReviewsCountDefaultOnUsers < ActiveRecord::Migration
  def change
      change_column_default :users, :reviews_count, 0
  end
end
