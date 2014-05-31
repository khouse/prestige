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

namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export, :roles => :app do
    run "cd #{current_path} && #{sudo} foreman export --app=#{app_name} --user=www-data -p 5000 -f Procfile upstart /etc/init"
  end

  desc "Start the application services"
  task :start, :roles => :app do
    run "#{sudo} service #{app_name} start"
  end

  desc "Stop the application services"
  task :stop, :roles => :app do
    run "#{sudo} service #{app_name} stop"
  end

  desc "Restart the application services"
  task :restart, :roles => :app do
    run "#{sudo} service #{app_name} start || #{sudo} service #{app_name} restart"
  end
end

namespace :deploy do
  task :restart, :roles => :app do
    foreman.restart # uncomment this (and comment line above) if we need to read changes to the procfile
  end
end
