require "rails_helper"

RSpec.describe "characters#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/characters/#{character.id}"
  end

  describe "basic destroy" do
    let!(:character) { create(:character) }

    it "updates the resource" do
      expect(CharacterResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Character.count }.by(-1)
      expect { character.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
