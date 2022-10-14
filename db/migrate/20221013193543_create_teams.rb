class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :wins
      t.integer :losses
      t.boolean :active

      t.timestamps
    end
  end
end
