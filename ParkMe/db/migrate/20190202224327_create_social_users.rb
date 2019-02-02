class CreateSocialUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :social_users do |t|
      t.string :userId
      t.string :accessToken
      t.string :signedRequest

      t.timestamps
    end
  end
end
