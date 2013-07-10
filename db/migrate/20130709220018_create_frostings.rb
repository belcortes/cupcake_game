class CreateFrostings < ActiveRecord::Migration
  def change
    create_table :frostings do |t|
      t.string :name
      t.string :color
      t.integer :cupcake_id

      t.timestamps
    end
  end
end
