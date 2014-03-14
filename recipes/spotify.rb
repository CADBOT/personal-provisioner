#TODO make idempotent
execute 'echo "deb http://repository.spotify.com stable non-free" | sudo tee -a /etc/apt/sources.list'
execute 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59'
execute 'sudo apt-get update'
package 'spotify-client'
