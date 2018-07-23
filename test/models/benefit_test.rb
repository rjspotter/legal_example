require "test_helper"

class BenefitTest < ActiveSupport::TestCase

  def setup
    super
    @valid_attributes = {
      name: "FooBar",
      description: "Some Cow Funk"
    }
  end

  def with_overrides(overrides = {})
    Benefit.new(@valid_attributes.merge(overrides))
  end

  def test_loads_seeds
    assert_equal 3, Benefit.count
    known_plan = Benefit.first.plans.first
    Benefit.all.each do |benefit|
      assert_equal known_plan, benefit.plans.first
    end
  end

  def test_must_be_valid
    assert Benefit.new(@valid_attributes).valid?
  end

  def test_must_have_name
    assert_not with_overrides(name: nil).valid?
    assert_not with_overrides(name: "").valid?
  end

  def test_must_have_description
    assert_not with_overrides(description: nil).valid?
    assert_not with_overrides(description: "").valid?
  end

  def test_name_is_unique
    assert with_overrides(name: "duptest").save
    assert_not with_overrides(name: "duptest").valid?
  end
end
