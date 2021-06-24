class CreateCommets < ActiveRecord::Migration[6.0]
  def change
    create_table :commets do |t|
      t.string :Comment
      t.text :body
      t.references :commentable, polymorphic: true, null: false
      t.integer :parent_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
