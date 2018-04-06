class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all
  end

  def show
    @grants = Grant.where(institution_id: params[:id])
  end
end
