#
# Cookbook Name:: personal-provisioner
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

# Install fish first so I can make it my defualt shell
#include_recipe 'personal-provisioner::fish'

#Create account
group node['computer']['group']
user node['computer']['user'] do
  group node['computer']['group']
  system true
  #shell '/usr/local/bin/fish'
  #TODO read this from the node and don't hardcode it
  home "/home/CAD"
  shell '/bin/bash'
  #TODO create a databag with the user password
end

directory '/home/CAD' do
  #TODO set permissions properly
  owner 'CAD'
  group 'CAD'
end

#include_recipe 'homesick'

# The castle name must match the github repoe name
# ('dotfiles' in this case) or it won't work. I'm not
# sure if this is a bug or feature of the cookbook
# I'm using
#homesick_castle 'dotfiles' do 
#  user 'CAD'
#  source 'git://github.com/CADBOT/dotfiles.git'
#  action :install
#end



#Install ruby stuff
# Would like to get rid of this apt-get update hack if possible...
# It might not be because the underlying cookbook uses the package
# resource instead of the apt resource
execute 'sudo apt-get update'
#include_recipe 'ruby_build'

#Note: I might have to install also/isntead into /opt/rubies for toot to have it
#Install a ruby via ruby-build
#ruby_build_ruby '1.9.3-p0' do
#  prefix_path '/home/CAD/.rubies/1.9.3-p0'
#  user 'CAD'
#  group 'CAD'
#end

#ruby_build_ruby '2.1.1' do
#  prefix_path '/home/CAD/.rubies/2.1.1'
#end

#Hacky way to install spotify
#TODO: look into using this  opscode-cookbooks / ubuntu
# to provide a custome resources template
#include_recipe 'personal-provisioner::spotify'
#include_recipe 'personal-provisioner::steam'
