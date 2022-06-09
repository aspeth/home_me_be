class CreateUserShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_shelters do |t|
      t.references :user, foreign_key: true
      t.references :shelter, foreign_key: true

      t.timestamps
    end
  end
end
