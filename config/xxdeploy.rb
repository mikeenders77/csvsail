require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'


set :domain, 'rightitjobs.com'
set :deploy_to, '/home/deploy/csvsail'
set :repository, 'git@github.com:mikeenders77/csvsail.git'
set :branch, 'master'
set :rails_env, 'production'
set :user, 'deploy'
set :application_name, 'csvsail'
set :shared_paths, ['config/database.yml', 'config/secrets.yml', 'log']
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'public/uploads')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')
#set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/puma.rb', 'config/secrets.yml')

task :environment do
  invoke :'rbenv:load'
end

task setup: :environment do
  command %[mkdir -p "#{fetch(:shared_path)}/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:shared_path)}/config"]

  comment %{Be sure to add 'database.yml', 'secrets.yml' and 'puma.rb' in '#{fetch(:shared_path)}/config/' directory}
end

desc "Deploys the current version to the server."
task deploy: :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'systemctl:restart', 'deploy-puma'
      #invoke :'puma:phased_restart'
      #invoke :'systemctl:restart', 'deploy-bg-worker'
      #invoke :'whenever:update'
    end
  end
end