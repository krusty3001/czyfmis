set :application, "yfmis"
set :repository,  "https://krusty@bitbucket.org/krusty/yfmis "
set :user, "passenger"
set :scm, :mercurial
set :deploy_to, "/var/www/passenger/yfmis"

server "s15435687.onlinehome-server.info:1699", :app, :web, :db, :primary => true

set :use_sudo, false

# server details
default_run_options[:pty] = true


#  Passenger mod_rails
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

