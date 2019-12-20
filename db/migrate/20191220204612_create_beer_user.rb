class CreateBeerUser < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_users do |t|
			t.datetime :seen_at
      t.boolean  :favorite
    end

    add_reference :beer_users, :user, foreign_key: true
    add_reference :beer_users, :beer, foreign_key: true

  end

end
