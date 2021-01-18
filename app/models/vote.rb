class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true, counter_cache: true
  belongs_to :voter, class_name: 'Teacher', foreign_key: 'voter_id'

  validates_uniqueness_of :voter_id, scope: [:votable_id, :votable_type]
end
