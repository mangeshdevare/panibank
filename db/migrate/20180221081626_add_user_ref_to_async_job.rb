class AddUserRefToAsyncJob < ActiveRecord::Migration
  def change
    add_column :async_jobs, :user_id, :integer
  end
end
