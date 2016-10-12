# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'rubygems'
set :repo_url, 'https://github.com/ruby-china/rubygems-mirror.git'
set :deploy_to, '/home/ubuntu/www/rubygems'
set :log_level, :info

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'vendor/bundle', 'public')

# Default value for keep_releases is 5
set :keep_releases, 5

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

after 'deploy:publishing', 'unicorn:restart'
