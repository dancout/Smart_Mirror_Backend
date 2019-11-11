# cd ~/
sudo apt-get install python3-dev python3-pip python3-virtualenv
pip3 install --upgrade pip setuptools
pip3 install requests
mkdir ~/venvs
python3 -m venv venvs/flask1804
source ~/venvs/flask1804/bin/activate
pip install --upgrade pip
pip install wheel
pip install flask gunicorn

# cd /mnt/c/Users/Daniel\ Couturier/Documents/Projects/Smart_Mirror_Backend

bash run.sh