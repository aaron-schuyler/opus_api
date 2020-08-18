class CreateFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :folders do |t|
      t.string :name
      t.string :color
      t.references :user

      t.timestamps
    end
  end
end
