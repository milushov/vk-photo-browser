require "rvm/capistrano"
require "bundler/capistrano"

ssh_options[:forward_agent] = true
set :application, "vk-photo-browser"
set :repository,  "git@github.com:nikmarchenko/vk-photo-browser"
set :branch, "master"
set :user,   "deploy"
set :deploy_via, :remote_cache
set :keep_releases, 3
set :scm, :git
set :use_sudo, false

set :deploy_to, "/var/www/#{application}/production"
set :rails_env, "production"
set :branch, "master"


role :web, "82.196.10.153"                   # Your HTTP server, Apache/etc
role :app, "82.196.10.153"                   # This may be the same asyour `Web` server
role :db,  "82.196.10.153", :primary => true # This is where Rails migrations will run

namespace :deploy do

  namespace :custom_symlinks do
    task :custom_configs do
      run "ln -nsf #{shared_path}/config/initializers/vkontakte_api.rb #{current_release}/config/initializers/"
      run "ln -nsf #{shared_path}/config/database.yml #{current_release}/config/"
    end
    task :default do
      custom_configs
    end
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end

before "deploy:assets:precompile", "deploy:custom_symlinks"
after  "deploy:update", "deploy:cleanup"