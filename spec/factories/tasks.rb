# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    family_member { create(:family_member) }
    description { 'chore'}
  end
end