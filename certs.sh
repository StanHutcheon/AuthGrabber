#read -p "Please enter here the domain or IP address of your Siri server (thing.something.com or 12.34.56.78): " SERVER
read -p "Now enter your name: " NAME
read -p "Now enter your email: " EMAIL
read -p "When it asks for a password, just enter 'pass' for all of them (no quotations) Press enter to continue..."
openssl genrsa -out ca.key 1024
openssl req -new -x509 -days 365 -key ca.key -out ca.crt << EOF
US
California
Cupertino
$NAME, Inc.
guzzoni.apple.com
guzzoni.apple.com
$EMAIL



EOF
openssl genrsa -des3 -out server.key 4096
openssl req -new -key server.key -out server.csr << EOF
US
California
Cupertino
$NAME, Inc.
guzzoni.apple.com
guzzoni.apple.com
$EMAIL



EOF
openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.passless.crt
openssl rsa -in server.key -out server.key.insecure
mv server.key server.key.secure
mv server.key.insecure server.passless.key
echo "Created."
sudo rm ca.key server.csr server.key.secure
echo "Install ca.crt to your device by emailing it to yourself or putting it up on a web server or something."