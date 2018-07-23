class PlansController < ApplicationController

  def show
    if @plan = Plan.where(countries_id: params[:country_id], id: params[:id]).first
    else
      render plain: "Not Found", status: :not_found
    end
  end

end
