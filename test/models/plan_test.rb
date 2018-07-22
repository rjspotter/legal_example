require "test_helper"

class PlanTest < ActiveSupport::TestCase

  def setup
    super
    @valid_attributes = {
      price_hundredths: 100,
      name: "FooBar",
      description: "Some Cow Funk",
      country: "US",
      currency: "USD"
    }
  end

  def with_overrides(overrides = {})
    Plan.new(@valid_attributes.merge(overrides))
  end

  def test_loads_seeds
    assert_equal 1, Plan.count
    assert_equal 3, Plan.first.benefits.count
  end

  def test_must_be_valid
    assert Plan.new(@valid_attributes).valid?
  end

  def test_price_hundredths_must_be_positive_integer
    assert_not with_overrides(price_hundredths: nil).valid?
    assert_not with_overrides(price_hundredths: -1).valid?
    assert_not with_overrides(price_hundredths: 0).valid?
    assert_not with_overrides(price_hundredths: 1.10).valid?
  end

  def test_name_must_exist
    assert_not with_overrides(name: nil).valid?
    assert_not with_overrides(name: "").valid?
  end

  def test_description_must_exist
    assert_not with_overrides(description: nil).valid?
    assert_not with_overrides(description: "").valid?
  end

  def test_country_must_be_us
    assert_not with_overrides(country: nil).valid?
    assert_not with_overrides(country: "").valid?
    assert_not with_overrides(country: "USA").valid?
    assert_not with_overrides(country: "UK").valid?
  end

  def test_currency_must_be_usd
    assert_not with_overrides(currency: nil).valid?
    assert_not with_overrides(currency: "").valid?
    assert_not with_overrides(currency: "GBP").valid?
  end

  def test_must_not_have_duplicates
    assert with_overrides(name: "dupcheck").save
    assert_not with_overrides(name: "dupcheck").save
  end

  def test_benefits_must_not_be_repeated
    subject = with_overrides(name: "dupbenefits")
    assert subject.save
    benefit = Benefit.first
    subject.benefits << benefit
    assert subject.save
    assert_raises(ActiveRecord::RecordNotUnique) do
      subject.benefits << benefit
      subject.save
    end
  end

  def test_price_is_formatted
    assert_equal "1.00 USD", with_overrides().price
    assert_equal "0.99 USD", with_overrides(price_hundredths: 99).price
  end
end
