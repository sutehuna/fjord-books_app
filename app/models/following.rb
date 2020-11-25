# frozen_string_literal: true

class Following < ApplicationRecord
  belongs_to :subscriber, class_name: 'User'
  belongs_to :target, class_name: 'User'
end
