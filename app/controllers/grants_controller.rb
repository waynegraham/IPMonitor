class GrantsController < ApplicationController
  def index
    @grants = Grant.all.includes(:institution)
  end

  def show
    # @resources = Resource.current_recent_status(params)
    @resources = Resource.where(grant_id: params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @resources.to_json(include: :latest_status) }
    end
  end
end
