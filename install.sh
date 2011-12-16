echo "This installs everything you need to get AuthGrabber working."
echo "I will now begin..."
sudo chmod -R 770 ./
sudo ./scripts/dependencies.sh
sudo ./scripts/certs.sh
echo "Everything is done. when you're ready, just type sudo ./cache.sh in terminal :)"