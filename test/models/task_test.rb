require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should be valid with title, and status" do
    task = Task.new(title: "Test Task", status: "pending")
    assert task.valid?
  end

  test "should not be valid without title" do
    task = Task.new(description: "Test description", due_date: Date.today, status: "pending")
    refute task.valid?
  end

  test "should not be valid without status" do
    task = Task.new(title: "Test Task", description: "Test description", due_date: Date.today)
    refute task.valid?
  end
end
