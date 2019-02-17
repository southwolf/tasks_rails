require 'test_helper'

class TasksRailsSchemaTest < ActiveSupport::TestCase
  # query { task(id:1) { id title } }
  test 'should fetch a task' do
    id = Task.last.id
    query = <<~GRAPHQL
      query GetTask($id: ID!) {
        task(id: $id) { id title }
      }
    GRAPHQL

    response = TasksRailsSchema.execute(
      query,
      variables: { id: id }
    )
    assert_nil(response['errors'])
    assert_equal('Data Migration', response['data']['task']['title'])
  end

  # query { tasks { id title } }
  test 'should fetch all tasks' do
    query = <<~GRAPHQL
      query { tasks { id title } }
    GRAPHQL

    response = TasksRailsSchema.execute(query)
    assert_nil(response['errors'])
    assert_equal(2, response['data']['tasks'].length)
  end

  # mutation { createTask(title: "Hello"){ task { id title } } }
  test 'shuold create a task' do
    title = 'Hello'
    query = <<~GRAPHQL
      mutation CreateTask($title: String!) {
        createTask(title: $title) { task { id title } } }
    GRAPHQL
    
    assert_difference 'Task.count' do
      response = TasksRailsSchema.execute(
        query,
        variables: { title: title }
      )
    end
  end

  # mutation { deleteTask(task_id: 1){ status } }
  test 'shuold delete a task' do
    id = Task.last.id
    query = <<~GRAPHQL
      mutation DeleteTask($id: ID!) {
        deleteTask(id: $id) { id } }
    GRAPHQL

    assert_difference 'Task.count', -1 do
      response = TasksRailsSchema.execute(
        query,
        variables: { id: id }
      )
    end
  end

  # mutation { editTask(id: 6, title: "Hey"){ task {id title } } }
  test 'shuold edit a task' do
    id = Task.last.id
    title = 'Aloha Oe'
    query = <<~GRAPHQL
      mutation EditTask($id: ID!, $title: String!) {
        editTask(id: $id, title: $title) { task { id title } } }
    GRAPHQL

    response = TasksRailsSchema.execute(
      query,
      variables: { id: id, title: title }
    )
    assert_nil(response['errors'])
    assert_equal(title, response['data']['editTask']['task']['title'])
  end
end
