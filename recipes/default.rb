#
# Cookbook Name:: personal-provisioner
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

# Install fish first so I can make it my defualt shell

#worked but gonna try homesick cookbook
#chef_gem 'homesick'


#include_recipe 'personal-provisioner::fish'

#Create account
#

group node['computer']['group']

user node['computer']['user'] do
  group node['computer']['group']
  system true
  #shell '/usr/local/bin/fish'
  #TODO read this from the ndoe and don't hardcode it
  home "/home/CAD"
  shell '/bin/bash'
end

directory '/home/CAD' do
  #TODO set permissions properly
  owner 'CAD'
  group 'CAD'
end

include_recipe 'homesick'

# TODO need to create a home directory before this will work
homesick_castle 'main_castle' do 
  user 'CAD'
  source 'git://github.com/CADBOT/dotfiles.git'
  action :install
end

=begin



#Install ruby stuff
# Would like to get rid of this apt-get update hack if possible...
# It might not be because the underlying cookbook uses the package
# resource instead of the apt resource
execute 'sudo apt-get update'
include_recipe 'ruby_build'

#Note: I might have to install also/isntead into /opt/rubies for toot to have it
#Install a ruby via ruby-build
#ruby_build_ruby '1.9.3-p0' do
  #prefix_path '/home/CAD/.rubies/1.9.3-p0'
  ##user 'CAD'
  ##group 'CAD'
#end

ruby_build_ruby '2.1.1' do
  prefix_path '/home/CAD/.rubies/2.1.1'
end


=end
