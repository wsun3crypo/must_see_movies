require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "Direct Associations" do
    it { should have_many(:roles) }
  end

  describe "InDirect Associations" do
    it { should have_many(:movies) }
  end

  describe "Validations" do
  end
end
