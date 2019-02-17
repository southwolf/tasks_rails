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
end
