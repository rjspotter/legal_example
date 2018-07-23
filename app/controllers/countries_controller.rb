class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def show
    @plans = Plan.where(countries_id: params[:id]).all
    if @plans.blank?
      render plain: "Not Found", status: :not_found
    else
      respond_to do |format|
        format.html
        format.json { render json: plans_as_json, layout: false }
      end
    end
  end

private

  def plans_as_json
    @plans.map { |x| x.as_json(only: [:id, :name], methods: [:price]) }
  end
end
