require "test_helper"

class DotaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dotum = dota(:one)
  end

  test "should get index" do
    get dota_url, as: :json
    assert_response :success
  end

  test "should create dotum" do
    assert_difference("Dotum.count") do
      post dota_url, params: { dotum: { hero: @dotum.hero, item: @dotum.item, player: @dotum.player, team: @dotum.team } }, as: :json
    end

    assert_response :created
  end

  test "should show dotum" do
    get dotum_url(@dotum), as: :json
    assert_response :success
  end

  test "should update dotum" do
    patch dotum_url(@dotum), params: { dotum: { hero: @dotum.hero, item: @dotum.item, player: @dotum.player, team: @dotum.team } }, as: :json
    assert_response :success
  end

  test "should destroy dotum" do
    assert_difference("Dotum.count", -1) do
      delete dotum_url(@dotum), as: :json
    end

    assert_response :no_content
  end
end
