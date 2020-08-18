class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.references :doc
      t.references :user
      t.boolean :public

      t.timestamps
    end
  end
end
