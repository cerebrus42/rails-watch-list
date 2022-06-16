class ChangeTypeOfMovieRating < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      change_table :movies do |t|
        dir.up   { t.change :rating, 'real USING CAST(rating AS real)' }
        dir.down { t.change :rating, :string }
      end
    end
  end
end
