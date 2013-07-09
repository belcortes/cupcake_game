class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider
      t.string :secret
      t.string :uid
      t.integer :user_id
      t.string :user_name
      t.datetime :expires_at
      t.string :name
      t.string :image
      t.string :url
      t.string :token

      t.timestamps
    end
  end
end
