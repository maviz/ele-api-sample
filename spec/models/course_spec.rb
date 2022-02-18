require 'rails_helper'

RSpec.describe Course, type: :model do
  context "model is defined" do
    it "expects a Course model to be defined" do
      expect('Course'.constantize).to eq(Course)
    end
  end

  context "associations are defined" do
    it { is_expected.to belong_to(:author) }
  end


end

