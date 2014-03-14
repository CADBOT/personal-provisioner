#TODO have a %w array to instappll dep pacakges such as curl

remote_file '/tmp/steam.deb' do 
  source 'http://media.steampowered.com/client/installer/steam.deb'
end

dpkg_package 'steam' do
  source '/tmp/steam.deb'
end
