require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one) # Load user fixture
    @task = tasks(:one) # Load task fixture
    sign_in @user       # Sign in the user
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count', 1) do
      post tasks_url, params: { task: { title: 'New Task', status: 'pending', user_id: @user.id } }
    end
    assert_redirected_to task_url(Task.last)
  end

  #should show the taske
  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  #shoudl get the edit action
  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  #should update the task
  test "should update task" do
    patch task_url(@task), params: { task: { title: 'Updated Task' } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end
    assert_redirected_to tasks_url
  end
end
