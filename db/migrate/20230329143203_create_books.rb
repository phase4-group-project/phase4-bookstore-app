class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string "title", null: false
      t.text "description", null: false
      t.integer "price", default: 0, null: false
      t.integer "author_id", default: 0, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
