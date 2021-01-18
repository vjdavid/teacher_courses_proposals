class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true, null: false
      t.references :voter, null: false, foreign_key: { to_table: :teachers }

      t.timestamps
    end
  end
end
