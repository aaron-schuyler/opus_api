class AddColumnToDocs < ActiveRecord::Migration[5.2]
  def change
    add_column :docs, :exerp, :text
  end
end
