require "rails_helper"

RSpec.describe Character, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:actors) }

    it { should belong_to(:movie) }
  end

  describe "InDirect Associations" do
    it { should have_one(:director) }
  end

  describe "Validations" do
  end
end
