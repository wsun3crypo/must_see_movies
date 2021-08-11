require 'rails_helper'

RSpec.describe CharacterResource, type: :resource do
  describe 'serialization' do
    let!(:character) { create(:character) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(character.id)
      expect(data.jsonapi_type).to eq('characters')
    end
  end

  describe 'filtering' do
    let!(:character1) { create(:character) }
    let!(:character2) { create(:character) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: character2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([character2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:character1) { create(:character) }
      let!(:character2) { create(:character) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            character1.id,
            character2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            character2.id,
            character1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
