require "rails_helper"

RSpec.describe "characters#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/characters/#{character.id}", payload
  end

  describe "basic update" do
    let!(:character) { create(:character) }

    let(:payload) do
      {
        data: {
          id: character.id.to_s,
          type: "characters",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CharacterResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { character.reload.attributes }
    end
  end
end
