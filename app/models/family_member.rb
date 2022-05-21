# == Schema Information
#
# Table name: family_members
#
#  id          :bigint           not null, primary key
#  name        :string
#  tasks_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class FamilyMember < ApplicationRecord
end
