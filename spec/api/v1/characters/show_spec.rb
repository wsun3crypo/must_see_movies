require 'rails_helper'

RSpec.describe "characters#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/characters/#{character.id}", params: params
  end

  describe 'basic fetch' do
    let!(:character) { create(:character) }

    it 'works' do
      expect(CharacterResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('characters')
      expect(d.id).to eq(character.id)
    end
  end
end
