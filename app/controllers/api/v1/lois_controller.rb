class Api::V1::LoisController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:index]
  def index
  	@lois = Loi.all
  end

  def show
  	@loi = Lois.find(params[:id])
  end
end
