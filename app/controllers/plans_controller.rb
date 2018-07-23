class PlansController < ApplicationController

  def show
    if @plan = Plan.where(countries_id: params[:country_id], id: params[:id]).first
      respond_to do |format|
        format.html
        format.json { render json: plan_as_json, layout: false }
      end
    else
      render plain: "Not Found", status: :not_found
    end
  end

private

  def plan_as_json
    @plan.as_json(methods: :price,
                  only: [:id, :name],
                  include: {benefits: {only: [:name, :description]}})
  end

end
