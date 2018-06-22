# config valid for current version and patch releases of Capistrano
lock "~> 3.7.0"

set :application, "csvsail"
set :repo_url, "git@github.com:mikeenders77/csvsail.git"

set :user, 'deploy'
set :deploy_to, '/home/deploy/csvsail'
set :puma_threads,    [2, 8]
#append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp


set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache

set :puma_bind,       "unix:///home/deploy/csvsail/current/shared/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "/home/deploy/csvsail/shared/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to true if using ActiveRecord
# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"



# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
