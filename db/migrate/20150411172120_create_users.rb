class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "email",           null: false
      t.string   "password_digest", null: false
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.string   "first_name"
      t.string   "last_name"
      t.string   "phone"
      t.string   "country_code"
      t.string   "authy_id"

      t.timestamps null: false
    end
  end
end
