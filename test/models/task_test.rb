require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "saving task with title" do
    task = Task.new(title: "Hello")
    assert task.save
  end

  test "cannot save task without title" do
    task = Task.new(title: "")
    assert_not task.save
  end

  test "record changes on save" do
    task = Task.new(title: "Hello")
    task.save
    assert_difference('task.versions.count') do
      task.update(done: true)
    end
  end
end
