class CreateToppings < ActiveRecord::Migration
  def change
    create_table :toppings do |t|
      t.string :name
      t.string :color
      t.integer :cupcake_id

      t.timestamps
    end
  end
end
