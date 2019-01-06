require 'test_helper'

class PontuationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pontuation = pontuations(:one)
  end

  test "should get index" do
    get pontuations_url
    assert_response :success
  end

  test "should get new" do
    get new_pontuation_url
    assert_response :success
  end

  test "should create pontuation" do
    assert_difference('Pontuation.count') do
      post pontuations_url, params: { pontuation: { data: @pontuation.data, idUsuario: @pontuation.idUsuario, nome: @pontuation.nome, pontos: @pontuation.pontos } }
    end

    assert_redirected_to pontuation_url(Pontuation.last)
  end

  test "should show pontuation" do
    get pontuation_url(@pontuation)
    assert_response :success
  end

  test "should get edit" do
    get edit_pontuation_url(@pontuation)
    assert_response :success
  end

  test "should update pontuation" do
    patch pontuation_url(@pontuation), params: { pontuation: { data: @pontuation.data, idUsuario: @pontuation.idUsuario, nome: @pontuation.nome, pontos: @pontuation.pontos } }
    assert_redirected_to pontuation_url(@pontuation)
  end

  test "should destroy pontuation" do
    assert_difference('Pontuation.count', -1) do
      delete pontuation_url(@pontuation)
    end

    assert_redirected_to pontuations_url
  end
end
