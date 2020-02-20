class AddPlanetToFlats < ActiveRecord::Migration[5.2]
  def change
    add_reference :flats, :planet, foreign_key: true
  end
end
