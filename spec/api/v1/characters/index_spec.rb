require 'rails_helper'

RSpec.describe "characters#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/characters", params: params
  end

  describe 'basic fetch' do
    let!(:character1) { create(:character) }
    let!(:character2) { create(:character) }

    it 'works' do
      expect(CharacterResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['characters'])
      expect(d.map(&:id)).to match_array([character1.id, character2.id])
    end
  end
end
