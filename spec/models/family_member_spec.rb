# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FamilyMember, type: :model do
  include_examples 'valid_factory'

  describe 'validations' do
    subject(:family_member) { create(:family_member) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:tasks_count) }
  end
end
