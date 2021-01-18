class AddVotesCountToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :votes_count, :integer, null: false, default: 0
  end
end
