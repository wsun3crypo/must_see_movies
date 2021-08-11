class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  # GET /actors
  def index
    @actors = Actor.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@actors.where.not(:image_latitude => nil)) do |actor, marker|
      marker.lat actor.image_latitude
      marker.lng actor.image_longitude
      marker.infowindow "<h5><a href='/actors/#{actor.id}'>#{actor.name}</a></h5><small>#{actor.image_formatted_address}</small>"
    end
  end

  # GET /actors/1
  def show
    @character = Character.new
  end

  # GET /actors/new
  def new
    @actor = Actor.new
  end

  # GET /actors/1/edit
  def edit
  end

  # POST /actors
  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to @actor, notice: 'Actor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /actors/1
  def update
    if @actor.update(actor_params)
      redirect_to @actor, notice: 'Actor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /actors/1
  def destroy
    @actor.destroy
    redirect_to actors_url, notice: 'Actor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def actor_params
      params.require(:actor).permit(:name, :bio, :dob, :image)
    end
end
