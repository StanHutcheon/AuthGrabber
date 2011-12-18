echo "This installs everything you need to get AuthGrabber working."
echo "I will now begin..."
sudo chmod -R 770 ./
cd scripts
sudo ./dependencies.sh
sudo ./certs.sh
cd ../
echo "Everything is done. when you're ready, just type sudo ./cache.sh in terminal :)"