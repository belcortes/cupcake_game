class CreateCupcakes < ActiveRecord::Migration
  def change
    create_table :cupcakes do |t|
      t.string :name
      t.integer :current_score
      t.integer :user_id

      t.timestamps
    end
  end
end
