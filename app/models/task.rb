# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id               :bigint           not null, primary key
#  description      :string           not null
#  status           :integer          default("incomplete"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  family_member_id :bigint           not null
#

class Task < ApplicationRecord
  belongs_to :family_member, counter_cache: true

  enum status: {
    incomplete: 0,
    complete: 1
  }

  validates :description, presence: true
end
