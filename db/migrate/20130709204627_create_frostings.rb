class CreateFrostings < ActiveRecord::Migration
  def change
    create_table :frostings do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
