class AddDescriptionToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :description, :string
  end
end
