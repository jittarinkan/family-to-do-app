# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  include_examples 'valid_factory'

  describe 'associations' do
    it { is_expected.to belong_to(:family_member) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:status) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end
end
