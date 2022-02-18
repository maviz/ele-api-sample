require 'rails_helper'

RSpec.describe User, type: :model do
  context "model is defined" do
    it "expects a Course model to be defined" do
      expect('User'.constantize).to eq(User)
    end
  end

  context "associations are defined" do
    it { is_expected.to have_many(:authored_courses) }
  end
end

