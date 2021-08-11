class Api::V1::CharactersController < Api::V1::GraphitiController
  def index
    characters = CharacterResource.all(params)
    respond_with(characters)
  end

  def show
    character = CharacterResource.find(params)
    respond_with(character)
  end

  def create
    character = CharacterResource.build(params)

    if character.save
      render jsonapi: character, status: 201
    else
      render jsonapi_errors: character
    end
  end

  def update
    character = CharacterResource.find(params)

    if character.update_attributes
      render jsonapi: character
    else
      render jsonapi_errors: character
    end
  end

  def destroy
    character = CharacterResource.find(params)

    if character.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: character
    end
  end
end
