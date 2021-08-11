class ActorsController < ApplicationController
  before_action :set_actor, only: %i[show edit update destroy]

  def index
    @q = Actor.ransack(params[:q])
    @actors = @q.result(distinct: true).includes(:roles,
                                                 :movies).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@actors.where.not(image_latitude: nil)) do |actor, marker|
      marker.lat actor.image_latitude
      marker.lng actor.image_longitude
    end
  end

  def show
    @character = Character.new
  end

  def new
    @actor = Actor.new
  end

  def edit; end

  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to @actor, notice: "Actor was successfully created."
    else
      render :new
    end
  end

  def update
    if @actor.update(actor_params)
      redirect_to @actor, notice: "Actor was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @actor.destroy
    redirect_to actors_url, notice: "Actor was successfully destroyed."
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :bio, :dob, :image)
  end
end
