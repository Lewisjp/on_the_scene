class ScenesController < ApplicationController

  def index
    @scenes = Scene.all 
  end


  def show
    @scene = Scene.find(params[:id])
  end

end
