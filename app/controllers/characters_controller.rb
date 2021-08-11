class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]

  def index
    @q = Character.ransack(params[:q])
    @characters = @q.result(distinct: true).includes(:movie, :actors,
                                                     :director).page(params[:page]).per(10)
  end

  def show; end

  def new
    @character = Character.new
  end

  def edit; end

  def create
    @character = Character.new(character_params)

    if @character.save
      message = "Character was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @character, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @character.update(character_params)
      redirect_to @character, notice: "Character was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
    message = "Character was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to characters_url, notice: message
    end
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :movie_id, :actors_id)
  end
end
