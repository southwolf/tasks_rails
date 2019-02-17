# Tasks in Rails

A simple tasks CRUD api server, written in Ruby on Rails

## Architecture

A Ruby on Rails application follows the standard MVC pattern.

The Model encapsulates database access and domain logic in an ActiveRecord object - in this app, the [task.rb](app/models/task.rb)

The Controller acts on model and view. It controls data flow (based on the [routes](config/routes.rb)) into model object.

The View represents the visualization of data that model contains - in this app, the JSON output.

## API routes

The routes follows RESTful convention.

| Verb   | URI Pattern | Controller#Action |
|--------|-------------|-------------------|
| GET    | /tasks      | tasks#index       |
| POST   | /tasks      | tasks#create      |
| GET    | /tasks/:id  | tasks#show        |
| PATCH  | /tasks/:id  | tasks#update      |
| PUT    | /tasks/:id  | tasks#update      |
| DELETE | /tasks/:id  | tasks#destroy     |