# frozen_string_literal: true

require 'rails_helper'

shared_examples_for 'valid_factory' do
  subject { build described_class.to_s.underscore.to_sym }
  it { is_expected.to be_valid }
end