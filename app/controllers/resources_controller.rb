class ResourcesController < ApplicationController
  def index
    @resources = Resource.all.includes(:statuses)
    render 'resources/show'
  end

  def check_status
    @resource = Resource.find_by id: params[:id]
    @status = Status.run_check(@resource) unless @resource.nil?
    render json: @status.inspect
    # render json: @resource.statuses.last.to_json.force_encoding('UTF-8')
  end

  def show
    @resource = Resource.find_by_name(params[:id]) || Resource.find(params[:id])
    @statuses = Status.where(resource_id: @resource.id).order(created_at: :desc)
  end
end
