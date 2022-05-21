# == Schema Information
#
# Table name: family_members
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  tasks_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class FamilyMember < ApplicationRecord
  validates :name, presence: true
  validates :tasks_count, presence: true
end
