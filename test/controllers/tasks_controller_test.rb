require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

    #testing the index action
  test 'should get index' do
    get tasks_url
    assert_response :success
  end

    #test the show action
  test 'should get show' do
    get task_url(@task)
    assert_response :success
  end

    #testing the new action
  test 'should get new' do
    get new_task_url
    assert_response :success
  end

  #testing the create action
  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { title: 'Turn on the kettle'status: 'pending' } }
    end

    assert_redirected_to task_path(Task.last)
  end

  #testinfg tehj get edit action
  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  #testing the update action
  test 'should update task' do
    patch task_url(@task), params: { task: { title: 'Turn the kettle on later' } }
    assert_redirected_to task_url(@task)

    @task.reload
    assert_equal 'Turn the kettle on later', @task.title
  end
    #etsting the destroy action
  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
