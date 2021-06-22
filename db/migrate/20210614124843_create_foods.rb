class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string     :name,              null: false
      t.text       :ways,              null: false
      t.integer    :type_of_food_id,   null: false
      t.text       :ingredients,       null: false
      t.references :user,              null: false,  foreign_key: true

      t.timestamps
    end
  end
end
