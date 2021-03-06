require "test_helper"

class PlansControllerTest < ActionController::TestCase

  def test_lists_plans_for_country
    get :show, params: { id: 1, country_id: "US" }
    assert assigns(:plan)
    assert_response :ok
  end

  def test_lists_plans_for_country
    get :show, params: { id: 1, country_id: "US", format: :json }
    json = JSON.parse(response.body)
    assert_equal %w[id name price benefits], json.keys
    assert_equal %w[name description], json["benefits"].first.keys
    assert_response :ok
  end


  def test_not_found_if_wrong_country
    get :show, params: { id: 1, country_id: "RU" }
    assert_response :not_found
  end

end
