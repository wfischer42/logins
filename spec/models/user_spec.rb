require 'rails_helper'

RSpec.describe User, type: :model do
  context "ActiveRecord Model" do
    it { is_expected.to validate_presence_of(:email_address)}
    it { is_expected.to validate_presence_of(:full_name)}
    it { is_expected.to validate_presence_of(:password)}
    it { is_expected.to validate_uniqueness_of(:email_address)}
  end
end
