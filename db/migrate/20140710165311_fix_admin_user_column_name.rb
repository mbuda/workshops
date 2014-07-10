class FixAdminUserColumnName < ActiveRecord::Migration
  def self.up
    rename_column :users, :admin?, :admin
  end

  def self.down
  end
end
