set :application, "prestige"
set :repository,  "git@github.com:khouse/prestige.git"
set :deploy_to, "/var/www/#{application}"
set :user, 'root'
set :scm, :git 
set :branch, "master"

#role :app, "hodor.zebrarage.com"                # This may be the same as your `Web` server
role :app, "162.252.242.159"                # This may be the same as your `Web` server

# if you want to clean up old releases on each deploy uncomment this:
 after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
