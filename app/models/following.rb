class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'subscriber_id'
  belongs_to :target, class_name: 'User', foreign_key: 'target_id'
end
