class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :boolean
    add_column :users, :total_score, :integer
  end
end
