class CreateParkMeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :park_me_users do |t|
      t.string :password_digest

      t.timestamps
    end
  end
end
