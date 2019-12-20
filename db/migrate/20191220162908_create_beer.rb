class CreateBeer < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.datetime :seen_at
      t.string   :user_id
      t.boolean  :favorite

    end
    add_reference :beers, :user, foreign_key: true
  end
end
