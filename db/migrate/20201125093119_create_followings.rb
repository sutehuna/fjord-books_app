# frozen_string_literal: true

class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :subscriber, null: false
      t.references :target, null: false
      t.timestamps
    end
    add_index :followings, %i[subscriber_id target_id], unique: true
  end
end
