# cd ~/
source ~/venvs/flask1804/bin/activate
# cd /mnt/c/Users/Daniel\ Couturier/Documents/Projects
# Flask - Preprod / Dev
# cd Smart_Mirror_Backend

# inside /scripts folder, so need to drop back one directory
cd ..
FLASK_APP=app.py flask run
#Gunicorn - Prod
# inside /scripts folder, so need to drop back two directories
# cd ../..
# gunicorn Smart_Mirror_Backend.app:app