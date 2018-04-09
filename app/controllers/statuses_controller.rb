class StatusesController < ApplicationController
  def show
    @status = Status.find(params[:id])
    render json: @status.to_json.force_encoding('UTF-8')
  end
end
