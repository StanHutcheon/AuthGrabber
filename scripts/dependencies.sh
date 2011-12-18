echo "refreshing apt (just in case)..."
sudo apt-get update
echo "installing required stuff etc..."
sudo apt-get install dnsmasq ruby build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
echo "Installing dnsmasq settings..."
cd files
sudo cp ./dnsmasq.conf /etc/dnsmasq.conf
cd ../
echo "Installing RVM..."
bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
echo "Installing ruby 1.9.3... [this takes bloody ages :p]"
rvmsudo rvm install 1.9.3
rvm use 1.9.3 --default
echo "Installing required gems..."
rvmsudo gem install eventmachine CFPropertyList httparty json uuidtools
echo "done."