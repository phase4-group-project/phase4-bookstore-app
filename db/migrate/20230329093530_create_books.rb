class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
   
            t.string :title, null: false
            t.text :description, null: false
            t.integer :price, null: false, default: 0
            t.integer :author_id, null: false, default: 0
            t.belongs_to :user, null: false, foreign_key: true

      
            t.timestamps
          end
        end
  end

