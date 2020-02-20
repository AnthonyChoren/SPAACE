class PlanetsController < ApplicationController
  def show
    @planet = Planet.find(params[:id])
    @flats = @planet.flats
  end
end
