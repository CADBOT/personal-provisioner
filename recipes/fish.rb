remote_file 'fish_tarball' do
  path '/tmp/fish-2.1.0.tar.gz'
  source 'http://fishshell.com/files/2.1.0/fish-2.1.0.tar.gz'
  not_if do ::File.exists?('/usr/bin/fish') end 
end

# required to compile fish from source
package 'build-essential' do
  not_if do ::File.exists?('/usr/bin/fish') end 
end

package 'libncurses5-dev' do
  not_if do ::File.exists?('/usr/bin/fish') end 
end

bash 'install_tarball' do
  cwd '/tmp'
  user 'root'
  code <<-EOF
    tar -xvf fish-2.1.0.tar.gz
    cd fish-2.1.0
    ./configure; make; sudo make install
    sudo echo $(which fish) >> /etc/shells
  EOF
  not_if do ::File.exists?('/usr/bin/fish') end 
end

