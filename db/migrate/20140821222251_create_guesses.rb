class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :card, index: true
      t.string :guess

      t.timestamps
    end
  end
end
