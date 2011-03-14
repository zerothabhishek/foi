require 'test_helper'

class AnswerChoicesControllerTest < ActionController::TestCase
  setup do
    @answer_choice = answer_choices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_choices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer_choice" do
    assert_difference('AnswerChoice.count') do
      post :create, :answer_choice => @answer_choice.attributes
    end

    assert_redirected_to answer_choice_path(assigns(:answer_choice))
  end

  test "should show answer_choice" do
    get :show, :id => @answer_choice.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @answer_choice.to_param
    assert_response :success
  end

  test "should update answer_choice" do
    put :update, :id => @answer_choice.to_param, :answer_choice => @answer_choice.attributes
    assert_redirected_to answer_choice_path(assigns(:answer_choice))
  end

  test "should destroy answer_choice" do
    assert_difference('AnswerChoice.count', -1) do
      delete :destroy, :id => @answer_choice.to_param
    end

    assert_redirected_to answer_choices_path
  end
end
