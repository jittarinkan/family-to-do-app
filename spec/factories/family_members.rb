# frozen_string_literal: true

FactoryBot.define do
  factory :family_member do
    name { Faker::Name.first_name }
  end
end