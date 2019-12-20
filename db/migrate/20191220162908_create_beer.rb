class CreateBeer < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.integer  :beer_id
      t.string   :name
      t.string   :tagline
      t.string   :description
      t.float    :abv
    end
  end
end
