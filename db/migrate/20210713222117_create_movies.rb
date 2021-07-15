class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.belongs_to :genre
      t.string :image
      t.string :title
      t.date :release_date
      t.integer :rating

      t.timestamps
    end
  end
end
