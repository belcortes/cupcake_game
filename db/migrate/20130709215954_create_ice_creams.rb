class CreateIceCreams < ActiveRecord::Migration
  def change
    create_table :ice_creams do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
