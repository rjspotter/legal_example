class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def show
    @plans = Plan.where(countries_id: params[:id]).all
    if @plans.blank?
      render plain: "Not Found", status: :not_found
    end
  end
end
