require "sinatra/activerecord"
require 'sinatra/base'
require 'sinatra/flash'

require_relative 'controllers/users_controller'
require_relative 'controllers/posts_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/app_controller'
require_relative 'lib/database_connection'
require_relative 'lib/user'
require_relative 'lib/post'
