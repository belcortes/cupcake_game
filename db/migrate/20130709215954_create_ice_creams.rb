class CreateIceCreams < ActiveRecord::Migration
  def change
    create_table :ice_creams do |t|
      t.string :name
      t.string :color
      t.integer :cupcake_id

      t.timestamps
    end
  end
end
