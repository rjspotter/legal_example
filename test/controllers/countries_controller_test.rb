require "test_helper"

class CountriesControllerTest < ActionController::TestCase

  def test_can_list_the_countries
    get :index
    assert assigns(:countries).map(&:id).include?("US")
    assert_response :ok
  end

  def test_does_not_list_countries_without_plans
    Country.create(id: "RU", currency: "RUB")
    get :index
    assert_not assigns(:countries).map(&:id).include?("RU")
    assert_response :ok
  end

  def test_lists_plans_for_country
    get :show, params: { id: "US" }
    assert assigns(:plans)
    assert_response :ok
  end

  def test_can_list_plans_in_json
    get :show, params: {id: "US", format: :json}
    json = JSON.parse(response.body)
    assert_equal 2, json.count
    assert_equal %w[id name price], json.first.keys
  end

  def test_not_found_if_no_plans
    get :show, params: { id: "RU" }
    assert_response :not_found
  end
end
