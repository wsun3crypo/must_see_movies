require 'rails_helper'

RSpec.describe CharacterResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'characters',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CharacterResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Character.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:character) { create(:character) }

    let(:payload) do
      {
        data: {
          id: character.id.to_s,
          type: 'characters',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CharacterResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { character.reload.updated_at }
      # .and change { character.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:character) { create(:character) }

    let(:instance) do
      CharacterResource.find(id: character.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Character.count }.by(-1)
    end
  end
end
