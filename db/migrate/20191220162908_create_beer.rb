class CreateBeer < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.integer  :beer_id
      t.datetime :seen_at
      t.boolean  :favorite
      t.string   :name
      t.string   :tagline
      t.string   :description
      t.float    :abv
    end

    add_reference :beers, :user, foreign_key: true
  end
end
