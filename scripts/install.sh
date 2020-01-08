echo "Go in the root directory"
cd ~/

echo "Begin installations. Start with python3, pip3, and virtualenv"
sudo apt-get install python3-dev python3-pip python3-virtualenv
sudo pip3 install --upgrade pip setuptools

echo "Now on to the packages required for our backend"
sudo python3 -m pip install requests
sudo python3 -m pip install -U python-dotenv
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install wheel
sudo python3 -m pip install flask gunicorn
echo "Installations complete!"

echo "Now on to creating our virtual environment"
mkdir ~/venvs
python3 -m venv venvs/SmartMirrorBackendEnv
echo "Virtual environment setup complete!"

echo "Now we will add an autostart feature at boot"
cd ~/Smart_Mirror_Backend/scripts
. autoStart.sh

echo "Now we will add an .env file to store your personal credentials"
cd ~/Smart_Mirror_Backend/scripts
. createEnv.sh

echo "Now run the app."
cd ~/Smart_Mirror_Backend/scripts
. run.sh