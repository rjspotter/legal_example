require "test_helper"

class CountriesControllerTest < ActionController::TestCase

  def test_anyone_can_list_the_countries
    get :index
    assert assigns(:countries).map(&:id).include?("US")
    assert_response :ok
  end

  def test_lists_plans_for_country
    get :show, params: { id: "US" }
    assert assigns(:plans)
    assert_response :ok
  end

  def test_not_found_if_no_plans
    get :show, params: { id: "RU" }
    assert_response :not_found
  end
end
