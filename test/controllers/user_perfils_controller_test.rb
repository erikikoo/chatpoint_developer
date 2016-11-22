require 'test_helper'

class UserPerfilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_perfil = user_perfils(:one)
  end

  test "should get index" do
    get user_perfils_url
    assert_response :success
  end

  test "should get new" do
    get new_user_perfil_url
    assert_response :success
  end

  test "should create user_perfil" do
    assert_difference('UserPerfil.count') do
      post user_perfils_url, params: { user_perfil: { bairro: @user_perfil.bairro, celular: @user_perfil.celular, cidade: @user_perfil.cidade, email: @user_perfil.email, nascimento: @user_perfil.nascimento, sexo: @user_perfil.sexo, user_id: @user_perfil.user_id } }
    end

    assert_redirected_to user_perfil_url(UserPerfil.last)
  end

  test "should show user_perfil" do
    get user_perfil_url(@user_perfil)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_perfil_url(@user_perfil)
    assert_response :success
  end

  test "should update user_perfil" do
    patch user_perfil_url(@user_perfil), params: { user_perfil: { bairro: @user_perfil.bairro, celular: @user_perfil.celular, cidade: @user_perfil.cidade, email: @user_perfil.email, nascimento: @user_perfil.nascimento, sexo: @user_perfil.sexo, user_id: @user_perfil.user_id } }
    assert_redirected_to user_perfil_url(@user_perfil)
  end

  test "should destroy user_perfil" do
    assert_difference('UserPerfil.count', -1) do
      delete user_perfil_url(@user_perfil)
    end

    assert_redirected_to user_perfils_url
  end
end
