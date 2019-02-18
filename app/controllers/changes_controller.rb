class ChangesController < ApplicationController
  def index
    @changes = PaperTrail::Version.all
    render json: @changes
  end
end
