class AddPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
