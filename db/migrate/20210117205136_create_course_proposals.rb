class CreateCourseProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :course_proposals do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
