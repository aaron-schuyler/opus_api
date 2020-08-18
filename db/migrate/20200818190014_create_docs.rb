class CreateDocs < ActiveRecord::Migration[5.2]
  def change
    create_table :docs do |t|
      t.string :name
      t.text :body
      t.boolean :shared
      t.references :folder
      t.references :user

      t.timestamps
    end
  end
end
